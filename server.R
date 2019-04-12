function(input, output) {
  
  output$main_plot <- renderPlot({
    
    hist(diamonds$price,
         probability = TRUE,
         breaks = as.numeric(input$n_breaks),
         xlab = "Price",
         main = "Diamond Price Distribution",
         col = "yellow")
    
    if (input$individual_obs) {
      rug(diamonds$price)
    }
    
    if (input$density) {
      dens <- density(diamonds$price,
                      adjust = input$bw_adjust)
      lines(dens, col = "red")
    }
    
  })
}