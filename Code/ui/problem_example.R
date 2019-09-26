# Slide 4
#
# One issue that arises in the GDP app is the need to edit a table
# in multiple ways. For example, by manually editing it in an 
# interactive Rhandsontable, and also updating it in response to 
# a change to a different table, or to a selection from a set of
# radio buttons.
#
# This slide provides a simple example of the above requirement.
# But simple as the requirement is, subsequent slides show that it
# can easily go wrong.
#
# The unmarked button reveals a list of the variables required for 
# the example, and how they interact.

problem_example_ui = function(id) {
  ns = NS(id)
  tabPanel(
    "4",
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
        #button to show/hide text
        actionButton(ns("expand"), ""),
        #text to show/hide
        hidden(div(
          id = ns("variables"), 
          h3("Variables"),
          tags$ul(
            tags$li("Inputs"),
            tags$ul(
              tags$li("Editable table"),
              tags$li("Name")
            ),
            tags$li("Values"),
            tags$ul(
              tags$li("Editable table"),
              tags$li("Full table")
            ),
            tags$li("Outputs"),
            tags$ul(
              tags$li("Editable table")
            )
          )
        ))
      ),
      
      column(
        6,
        h3("Data in background, not displayed"),
        #uneditable table
        tableOutput(ns("full_table")),
        #text to show/hide
        hidden(div(
          id = ns("interactions"), 
          h3("Interactions"),
          tags$ul(
            tags$li("Copy (input editable table to value editable table)"),
            tags$li("Insert (value editable table into value full table, based on name)"),
            tags$li("Filter (value full table to value editable table, based on name)"),
            tags$li("Copy (value editable table to output editable table)")
          )
        ))
      )
    )
  )
}