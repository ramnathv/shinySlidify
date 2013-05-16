output$distPlot <- renderPlot({
  dist <- rnorm(input$obs)
  hist(dist)
})

outputOptions(output, 'distPlot', suspendWhenHidden = FALSE)