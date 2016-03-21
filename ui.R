library(shiny)

shinyUI(fluidPage(
  
  titlePanel("FRED data test of concept"),
  h5("Last ten observations of series downloaded from the FRED economic database"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("FREDcode", "Choose a dataset:", choices = c(
        "Industrial Production",
        "Consumer Price Index",
        "Initial Unemployment Claims"))
    ),
    
    mainPanel(
      ## textOutput("lastobs")
      tableOutput("lastobs")
    )
  )
  
))