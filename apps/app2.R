# Diego de Casillo, February 2013
library(datasets)
library(googleVis)
myOptions <- reactive({
  list(
    page = ifelse(input$pageable == TRUE,'enable','disable'),
    pageSize = input$pagesize,
    height = 400
  )
})
output$myTable <- renderGvis({
  gvisTable(Population[,1:5],options = myOptions())         
})

outputOptions(output, "myTable", suspendWhenHidden = FALSE)