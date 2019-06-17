#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
#브라우저로 출력 담당
ui <- fluidPage(
    #텍스트 입력
    textInput('myText','Input test'),
    verbatimTextOutput('txt1'),
    
    br(),br(),
    sliderInput('num','Number Increment',10,min=1,max=10),
    verbatimTextOutput('txt2'),
    
    selectInput('sel','Select',choices = c('Choice'='1','2','3')),
    verbatimTextOutput('txt3'),
    
    actionButton("action",label = "Button"),
    verbatimTextOutput('txt4'),
    
    radioButtons("radio",label=h3("Radio Button")
                 ,choices=list("choice1"=1,"choice2"=2),
                 selected=1),
    verbatimTextOutput('txt5')
    
)

# Define server logic required to draw a histogram
#처리 담당 = Logic
server <- function(input, output) {
    output$txt1<-renderText({input$myText})
    output$txt2<-renderText({input$num})
    output$txt3<-renderText({input$sel})
    output$txt4<-renderPrint({input$action})
    
}

# Run the application 
shinyApp(ui = ui, server = server)
