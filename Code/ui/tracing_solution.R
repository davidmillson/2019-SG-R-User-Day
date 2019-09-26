# Slide 7
#
# This slide uses the same, non-working solution, but in this case
# each piece of code the app runs also sends a message to the
# console. Now we can see that, when we change the selected person,
# it is updating the full table before the editable table, when in 
# fact we want the reverse to happen.
#
# Use the "Mark break" button to print a line marking a break in
# console messages, to make it easier to see what happens when.

tracing_solution_ui = function(id) {
  ns = NS(id)
  tabPanel(
    "7",
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
        #button to print a line of #s
        actionButton(ns("button"),"Mark break")
      ),
      
      column(
        6,
        h3("Data in background, not displayed"),
        #uneditable table
        tableOutput(ns("full_table"))
      ),
      #interactions map
      visNetworkOutput(ns("map"), height="auto")
    )
  )
}