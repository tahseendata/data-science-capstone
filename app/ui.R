## Capstone: Coursera Data Science
## Final Project

library(shiny)
library(markdown)

################ 
shinyUI(
        fluidPage(
                titlePanel("FINAL PROJECT - DATA SCIENCE CAPSTONE - USING NLP TO PREDICT WORDS"),
                sidebarLayout(
                        sidebarPanel(
                                helpText("ENTER A WORD, TEXT OR A SENTENCE TO PREVIEW NEXT WORD PREDICTION"),
                                hr(),
                                textInput("inputString", "ENTER THE TEXT / WORD / SENTENCE HERE",value = ""),
                                hr(),
                                helpText("1 - AFTER ENTER THE WORD WILL BE DISPLAYED THE PREDICTED NEXT WORD", 
                                         hr(),
                                         "2 - YOU HAVE TO ENTER A PARTIALLY TEXT /SENTENCE TO DISPLAY NEXT WORD PREDICTION",
                                         hr(),
                                         "3 - THE PREDICTED WORD IS SHOWN AT THE PREDICT NEXT WORD TEXTBOX."),
                                hr(),
                                hr()
                                ),
                mainPanel(
                        h2("FOLLOW THE PREDICT NEXT WORD AT THIS BOX"),
                        verbatimTextOutput("prediction"),
                        strong("WORD / TEXT / SENTENCE ENTERED:"),
                        strong(textOutput('phrase1')),
                        br(),
                        strong("USING SEARCH AT N-GRAMS TO SHOW NEXT WORD:"),
                        strong(textOutput('phrase2'))
                        )
                )
        )
)



