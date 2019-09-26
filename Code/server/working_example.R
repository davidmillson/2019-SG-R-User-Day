working_example_server = function(input, output, session) {
  #initial state
  value = reactiveValues(full_table = tibble(Name = rep(c("Alex", "Blake", "Chris"), each = 2),
                                             Category = rep(c("Policy", "Operations"),3),
                                             Experience=1:6),
                         editable_table = tibble(Category = c("Policy", "Operations"),
                                                 Experience=1:2))
  
  #Copy (input editable table to value editable table)
  observe({
    message("Copy (input editable table to value editable table)")
    if(!(input$editable_table %>% is.null)) {
      value$editable_table = input$editable_table %>% 
        hot_to_r %>% 
        as_tibble
    }
  })
  
  #Insert (value editable table into value full table)
  observe({
    message("Insert (value editable table into value full table)")
    value$full_table = isolate(value$full_table) %>% 
      filter(Name != input$name) %>% #remove the out of date information
      bind_rows(value$editable_table %>% mutate(Name = input$name)) %>% 
      arrange(Name)
  })
  
  #Filter (value full table to value editable table)
  observe({
    message("Filter (value full table to value editable table)")
    value$editable_table = value$full_table %>% 
      filter(Name == input$name) %>% 
      select(-Name)
  }, priority = 3)
  
  #Copy (value editable table to output editable table)
  output$editable_table = renderRHandsontable({
    message("Copy (value editable table to output editable table)")
    value$editable_table %>% rhandsontable
  })
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  #display the interactions map
  output$map = renderVisNetwork({
    example_map
  })
  
  #update displayed full table when the value changes
  output$full_table = renderTable({
    value$full_table
  })
  
  #print a line of #s
  observeEvent(input$button, cat("#############\n"))
}