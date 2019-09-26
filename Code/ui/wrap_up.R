# Slide 11
#
# This slide wraps up the talk. There's a link to the RStudio
# article on Shiny debugging, which talks about tracing, and
# also has some other approaches.

tabPanel(
  "11",
  fluidRow(
    column(2),
    column(10,
           h3("Wrapping up"),
           h4("More ways to debug Shiny apps"),
           a("https://shiny.rstudio.com/articles/debugging.html", 
             href = "https://shiny.rstudio.com/articles/debugging.html"),
           h4("Download the code for (most of) this app"),
           a("https://github.com/davidmillson/2019-SG-R-User-Day", 
             href = "https://github.com/davidmillson/2019-SG-R-User-Day"),
           h4("How to ask me questions"),
           a("david.millson@gov.scot", href = "mailto:david.millson@gov.scot"),
           p("Or ask me now!")
    )
  )
)