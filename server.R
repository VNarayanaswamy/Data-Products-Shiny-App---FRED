library(shiny)

library(quantmod)
library(downloader)

## quantmod provides getSymbols function, which allows easy download of FRED data.
## downloader package automatically determines download method.
##   Eliminates this error I'd get in shiny, but not RStudio:

## Error : Failed to download file. Error message:
##   unsupported URL scheme
## If this is related to https, possible solutions are:
## 1. Explicitly pass method= via the getSymbols call (or via setDefaults)
## 2. Install downloader, which may be able to automagically determine a method
## 3. Set the download.file.method global option

getFRED <- function(x) {
  retframe <- data.frame("date" = as.Date(character()))
  for(i in 1:length(x)) {
    temp <- getSymbols(x[i], src='FRED', auto.assign=FALSE)
    temp <- data.frame(date=index(temp), coredata(temp))
    retframe <- merge(retframe, temp, by="date", all=TRUE)
  }
  retframe
}

shinyServer(function(input, output) {
  
  id <- reactive({
    switch(input$FREDcode,
           "Industrial Production" = "INDPRO",
           "Consumer Price Index" = "CPIAUCNS",
           "Initial Unemployment Claims" = "ICSA")
  })
  
  ## output$lastobs <- renderText({id()})

    output$lastobs <- renderTable({
      thedata <- getFRED(id())
      thedata$date <- as.character(thedata$date)
      tail(thedata, 10)
  })
  
})