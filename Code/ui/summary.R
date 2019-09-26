# Slide 10
#
# This slide summarises my points. You need to know what the
# code is supposed to do. I find it helps to create a map of
# all the interactions, or at least the ones I deem important.
#
# You also need to know what the code is doing, which I do
# using messages to the console.
#
# There's other ways to approach these. These are just my 
# preferred approaches.

tabPanel(
  "10",
  h3("Debugging challenges in Shiny"),
  fluidRow(
    column(
      6,
      h4("Knowing what the code is supposed to do"),
      img(src="gdp_map.png",
          alt = "A dependency map of the Graduate Development Programme app",
          style = "height:auto;width:80%"),
      p("Map the dependencies and interactions")
    ),
    column(
      6,
      h4("Knowing what the code is actually doing"),
      img(src="tracing.png",
          alt = "An example of the trace as the Graduate Development Programme app runs",
          style = "height:auto;width:80%"),
      p("Use messages to trace the code as it runs")
    )
  )
)