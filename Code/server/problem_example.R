problem_example_server = function(input, output, session) {
  #setup initial values
  value = reactiveValues(full_table = tibble(Name = rep(c("Alex", "Blake", "Chris"), each = 2),
                                             Category = rep(c("Policy", "Operations"),3),
                                             Experience=1:6),
                         editable_table = tibble(Category = c("Policy", "Operations"),
                                                 Experience=1:2))
  #update editable table value when editable table input changes
  observe({
    if(!(input$editable_table %>% is.null)) {
      value$editable_table = input$editable_table %>% 
        hot_to_r %>% 
        as_tibble
    }
  })
  
  #update full table value when editable table value changes
  observe({
    value$full_table = isolate(value$full_table) %>% 
      filter(Name != input$name) %>% #remove the out of date information
      bind_rows(value$editable_table %>% mutate(Name = input$name)) %>% 
      arrange(Name)
  })
  
  #update editable table value when name input changes
  observe({
    value$editable_table = value$full_table %>% 
      filter(Name == input$name) %>% 
      select(-Name)
  }, priority = 3)
  
  #update editable table output when editable table input changes
  output$editable_table = renderRHandsontable({
    value$editable_table %>% rhandsontable
  })
  
  #update displayed full table when the value changes
  output$full_table = renderTable({
    value$full_table
  })
  
  #show/hide text
  observeEvent(
    input$expand, {
      toggle(id = "variables")
      toggle(id = "interactions")
      replicate(40, cat("#\n")) #just here to hide previous traces
    }
  )
}