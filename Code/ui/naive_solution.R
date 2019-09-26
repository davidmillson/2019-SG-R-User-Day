# Slide 6
#
# This slide shows an attempt at recreating the example from slide
# 4. Playing around with it, though, reveals a problem. Selecting
# a new person overwrites their data in the stored table with the
# data of the previously selected person.
#
# We've discussed the first step in debugging - knowing what the 
# code is supposed to do. We've already listed the variables and
# how they interact, but it's useful to go a step further and map
# out these interactions. The map of this solution is revealed by 
# the unmarked button.
#
# Thinking about what happens each time we interact with the app,
# in reference to the map, may help in diagnosing why the solution
# doesn't work as intended.

naive_solution_ui = function(id) {
  ns=NS(id)
  tabPanel(
    "6",
    fluidRow(
      column(
        6,
        h3("Displayed in app"),
        #name selector
        radioButtons(ns("name"),
                     "Choose person",
                     choices = c("Alex", "Blake", "Chris"),
                     selected = "Alex"),
        #editable table
        rHandsontableOutput(ns("editable_table")),
        #button to show/hide map
        actionButton(ns("expand"), "")
      ),
      
      column(
        6,
        h3("Data in background, not displayed"),
        #uneditable table
        tableOutput(ns("full_table"))
      ),
      #map to show/hide
      hidden(div(
        id=ns("map"),
        visNetworkOutput(ns("map"), height = "auto")
      ))
    )
  )
}