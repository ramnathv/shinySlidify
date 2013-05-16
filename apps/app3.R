## Markus Gesmann, February 2013
## Prepare data to be displayed
## Load presidential election data by state from 1932 - 2012
url <- paste0("http://www.google.com/fusiontables/api/query?",
  "sql=SELECT+*+FROM+1RPEUiwiM092IxMew7LhzEmMDvqPomAA7kqK1qa4")

dat <- read.csv(url, stringsAsFactors=TRUE)

## Add min and max values to the data
datminmax = data.frame(state=rep(c("Min", "Max"),21), 
  demVote=rep(c(0, 100),21),
  year=sort(rep(seq(1932,2012,4),2)))
dat <- rbind(dat[,1:3], datminmax)
require(googleVis)

myYear <- reactive({
  input$Year
})
output$year <- renderText({
  paste("Democratic share of the presidential vote in", myYear())
})
output$gvis <- renderGvis({
  myData <- subset(dat, (year > (myYear()-1)) & (year < (myYear()+1)))
  gvisGeoChart(myData,
    locationvar="state", colorvar="demVote",
    options=list(region = "US", displayMode = "regions", 
    resolution = "provinces",
    width = 400, height = 380,
    colorAxis="{colors:['#FFFFFF', '#0000FF']}"
  ))     
})

outputOptions(output, 'year', suspendWhenHidden = FALSE)
outputOptions(output, 'gvis', suspendWhenHidden = FALSE)