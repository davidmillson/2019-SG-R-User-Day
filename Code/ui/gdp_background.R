# Slide 2
#
# This slide gives some background to the Graduate Development Programme
# (GDP) rotations app. GDP rotations involve around 20 members of staff
# being assigned to 20 to 30 roles, with the goal being to find as good
# a combination of matches as possible for the development of the staff
#
# With six staff and roles, it is plausible for a human to hold all the
# relevant information and manually find the optimal solution, but with 
# 20 people to account for, this becomes impossible. Either the human has
# to rely on some heuristic estimate of the optimum, or instead use the
# aid of an automated tool...

tabPanel(
  "2",
  h3("Role matching for the Graduate Development Programme"),
  #display the example
  visNetworkOutput("gdp_demo", height = "auto"),
  actionButton("gdp_expand", "Expand")
)