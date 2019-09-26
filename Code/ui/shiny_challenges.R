# Slide 5
#
# This slide points out two things that are vital for debugging - 
# knowing what the code is supposed to do, and knowing what it does
# do.
#
# Both of these are required for debugging any programming project,
# but they are a bit different in Shiny and require some different
# techniques.

tabPanel(
  "5",
  h3("Debugging challenges in Shiny"),
  fluidRow(
    column(
      6,
      h4("Knowing what the code is supposed to do"),
      img(src="working_bike.png",
          alt = "An artistic impression of a bicycle",
          style = "height:auto;width:80%")
    ),
    column(
      6,
      h4("Knowing what the code is actually doing"),
      img(src="broken_bike.jpg",
          alt = "An actual bicycle, broken and lying on a beach",
          style = "height:auto;width:80%")
    )
  )
)