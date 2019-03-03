#UI.R
library(shiny)
ui<-shinyUI(fluidPage(
  titlePanel("Iris Dataset"),
  sidebarLayout(
    sidebarPanel(
      radioButtons("p", "Select column of iris dataset:",
                   list("Sepal.Length"='a', "Sepal.Width"='b', "Petal.Length"='c', "Petal.Width"='d')),
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
))

#SERVER.R
library(shiny)
server<- shinyServer(function(input, output) {
  output$distPlot <- renderPlot({
    if(input$p=='a'){
      i<-1
    }
    
    if(input$p=='b'){
      i<-2
    }
    
    if(input$p=='c'){
      i<-3
    }
    
    if(input$p=='d'){
      i<-4
    }
    
    x    <- iris[, i]
    
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })
})

# Run the application 
shinyApp(ui = ui, server = server)