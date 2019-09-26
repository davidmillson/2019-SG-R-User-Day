naive_solution_server = function(input, output, session) {
  #initial state
  value = reactiveValues(full_table = tibble(Name = rep(c("Alex", "Blake", "Chris"), each = 2),
                                             Category = rep(c("Policy", "Operations"),3),
                                             Experience=1:6),
                         editable_table = tibble(Category = c("Policy", "Operations"),
                                                 Experience=1:2))
  
  #Copy (input editable table to value editable table)
  observe({
    if(!(input$editable_table %>% is.null)) {
      value$editable_table = input$editable_table %>% 
        hot_to_r %>% 
        as_tibble
    }
  })
  
  #Insert (value editable table into value full table)
  observe({
    value$full_table = isolate(value$full_table) %>% 
      filter(Name != input$name) %>% #remove the out of date information
      bind_rows(value$editable_table %>% mutate(Name = input$name)) %>% 
      arrange(Name)
  })
  
  #Filter (value full table to value editable table)
  observe({
    value$editable_table = value$full_table %>% 
      filter(Name == input$name) %>% 
      select(-Name)
  })
  
  #Copy (value editable table to output editable table)
  output$editable_table = renderRHandsontable({
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
  
  #show/hide interactions map
  observeEvent(input$expand,
               toggle("map"))
}

#setup nodes for the interactions map
example_map_nodes = tibble(id = 1:5,
                           label = c("Editable table (input)",
                                     "Editable table (value)",
                                     "Editable table (output)",
                                     "Full table (value)",
                                     "Name (input)"),
                           shape = c("dot", "square", "triangle", "square", "dot"),
                           color = c("#E78FF3", "#67ED8C", "#0065BD", "#67ED8C", "#E78FF3"))

#setup links for the interactions map
example_map_links = tibble(from = c(1,2,4,2,5,5),
                           to = c(2,4,2,3,2,4),
                           label = c("Copy", "Insert", "Filter", "Copy", "Filter", "Insert"))

#create the interactions map
example_map = visNetwork(example_map_nodes,example_map_links) %>% 
  visEdges(color = "#333E48", arrows = "to") %>% 
  visPhysics(barnesHut = list(gravitationalConstant = -10000))