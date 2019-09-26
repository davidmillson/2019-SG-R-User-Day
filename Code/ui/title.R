# Slide 1

tabPanel(
  "1",
  fluidRow(
    column(2), #add some white space on the left
    column(
      10,
      h1("How not to be blinded by the Shiny"),
      #Image taken from https://www.flickr.com/photos/fabola/874357185, unaltered
      #Author Fabrice Florin, used under Creative Commons Attribute-ShareAlike 2.0 license
      img(src="Deer_staring_into_headlights.jpg",
          alt="Deer on road at night transfixed, staring into headlights. Mill valley, Marin avenue.",
          style = "height:auto;width:60%"),
      h2("Debugging Shiny apps")
    )
  )
)