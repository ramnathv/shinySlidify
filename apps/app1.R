dat1 <- reactive({
  dist = switch(input$dist, norm = rnorm, unif = runif, 
    exp = rexp, rnorm)
  dist(input$n)
})

output$plot1 <- renderPlot({
  dist = input$dist
  n = input$n
  hist(dat1(), main = sprintf("r%s(%s)", dist, n))
})

outputOptions(output, "plot1", suspendWhenHidden = FALSE)