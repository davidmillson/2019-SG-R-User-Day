#setup participants and roles for example
nodes = tibble(id = 1:12,
               label = c("Alex",
                         "Blake",
                         "Chris",
                         "Drew",
                         "Eli",
                         "Frankie",
                         "Agriculture",
                         "Business",
                         "Crime",
                         "Development",
                         "Environment",
                         "Fisheries"),
               shape = rep(c("dot", "square"), each=6),
               color = rep(c("#EC1629", "0E2180"), each=6))

#start without any links
links = tibble(from = integer(0),
               to = integer(0))

more_names = c("Gill", "Harper", "Indiana", "Jules", "Kelly", "Logan", "Max", "Nico",
               "Oberon", "Pat", "Quin", "River", "Sam", "Taylor")
more_roles = c("Governance", "HR", "Investment", "Justice", "Knowledge", "Legal", "Migration", "Negotiation",
               "Operations", "Poverty", "Quangos", "Resilience", "Social Security", "Tourism")

background = reactiveValues(net = visNetwork(nodes,links))

observeEvent(input$gdp_expand, {
               background$net = visNetwork(nodes %>% 
                                             bind_rows(tibble(id=13:26, label = more_names, shape="dot", color="#EC1629"),
                                                       tibble(id=27:40, label = more_roles, shape="square", color="#0E2180")),
                                           links)
})

#display example, with ability to add links
output$gdp_demo = renderVisNetwork({
  background$net %>% 
    #enable manipulation of the network, but only for adding and deleting edges
    visOptions(manipulation = list(enabled = TRUE,
                                   initiallyActive = TRUE, 
                                   addNode = FALSE, 
                                   editNode = FALSE, 
                                   deleteNode = FALSE, 
                                   editEdge = FALSE))
})