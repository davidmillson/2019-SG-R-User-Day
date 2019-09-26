library(shiny)
library(shinyjs)
library(shinythemes)
library(tidyverse)
library(rhandsontable)
library(visNetwork)
library(DT)

#load in modules for the different versions of the example
#using modules allows the reuse of variable names in different parts of the app
source("Code/ui/problem_example.R")
source("Code/server/problem_example.R")
source("Code/ui/naive_solution.R")
source("Code/server/naive_solution.R")
source("Code/ui/tracing_solution.R")
source("Code/server/tracing_solution.R")
source("Code/ui/working_example.R")
source("Code/server/working_example.R")

# Define UI for application that draws a histogram
ui = fluidPage(
  #set css theme
  theme=shinytheme("readable"),
  #include shinyjs package functionality (for showing/hiding elements)
  useShinyjs(),
  
  # Application title
  titlePanel(textOutput("header")), #include title with timer
  tabsetPanel(
    id = "Pages",
    #include the ui elements for each slide
    source("Code/ui/title.R", local=TRUE)$value, #slide 1
    source("Code/ui/gdp_background.R", local=TRUE)$value, #slide 2
    source("Code/ui/gdp_demo.R", local=TRUE)$value, #slide 3
    problem_example_ui("problem_example"), #slide 4
    source("Code/ui/shiny_challenges.R", local=TRUE)$value, #slide 5
    naive_solution_ui("naive_solution"), #slide 6
    tracing_solution_ui("tracing_solution"), #slide 7
    working_example_ui("working_example"), #slide 8
    source("Code/ui/gdp_map.R", local=TRUE)$value, #slide 9
    source("Code/ui/summary.R", local=TRUE)$value, #slide 10
    source("Code/ui/wrap_up.R", local=TRUE)$value #slide 11
  )
)

# Define server logic required to draw a histogram
server = function(input, output, session) {
  #include server elements for time
  source("Code/server/timer.R", local=TRUE)
  #include server elements for those slides that have interactive elements
  source("Code/server/gdp_background.R", local=TRUE) #slide 2
  callModule(problem_example_server, "problem_example") #slide 4
  callModule(naive_solution_server, "naive_solution") #slide 6
  callModule(tracing_solution_server, "tracing_solution") #slide 7
  callModule(working_example_server, "working_example") #slide 8
}

# Run the application 
shinyApp(ui = ui, server = server)