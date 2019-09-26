# Slide 8
#
# This slide demonstrates a fix to the solution that wasn't
# working. There's various ways it could be fixed, but for this
# we've simply set the priority of updating the editable table
# above that of updating the full table.
#
# You can compare the different tracing messages for this working
# example in comparison to the (almost identical) failed solution.

working_example_ui = function(id) {
  ns = NS(id)
  tabPanel(
    "8",
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