#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

# Define UI for application that draws a histogram
ui <- fluidPage(
    
    # Application title
    titlePanel("Old Faithful Eruption Durations"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("binwidth",
                        "Width of bins:",
                        min = 0.01,
                        max = 1,
                        value = .70)
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$distPlot <- renderPlot({
        # draw the histogram with the specified number of bins
        ggplot(faithful) +
            geom_histogram(aes(x = eruptions), binwidth = input$binwidth) + 
            scale_x_continuous(breaks = seq(1.5, 5.5, .25), minor_breaks = seq(1.5, 5.5,.05))
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
