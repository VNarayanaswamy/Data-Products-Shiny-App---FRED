library(shiny)

shinyUI(fluidPage(
  
  titlePanel("FRED data test of concept"),
  br("Last ten observations of series downloaded from the FRED economic database.",
     "server.R and ui.R code can also be found here:"),
  a(href="https://github.com/Violet-Knight/Data-Products-Shiny-App---FRED",
    "https://github.com/Violet-Knight/Data-Products-Shiny-App---FRED"),
  
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