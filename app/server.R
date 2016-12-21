## Capstone: Coursera Data Science
## Final Project

library(shiny); library(stringr); library(tm)

# Load Quadgram,Trigram & Bigram Data frame files
quadgram <- readRDS("quadgram.RData")
trigram <- readRDS("trigram.RData")
bigram <- readRDS("bigram.RData")
mesg <- ""

# Cleaning of user input before predicting the next word

predictNextWord <- function(x) {
  xclean <- removeNumbers(removePunctuation(tolower(x)))
  xs <- strsplit(xclean, " ")[[1]]

  if (length(xs)>= 3) {
    xs <- tail(xs,3)
    if (identical(character(0),head(quadgram[quadgram$word1 == xs[1] & quadgram$word2 == xs[2] & quadgram$word3 == xs[3], 4],1))){
      predictNextWord(paste(xs[2],xs[3],sep=" "))
    }
    else {mesg <<- "Prediction using Quadrigam"; head(quadgram[quadgram$word1 == xs[1] & quadgram$word2 == xs[2] & quadgram$word3 == xs[3], 4],1)}
  }
  else if (length(xs) == 2){
    xs <- tail(xs,2)
    if (identical(character(0),head(trigram[trigram$word1 == xs[1] & trigram$word2 == xs[2], 3],1))) {
      predictNextWord(xs[2])
    }
    else {mesg<<- "Prediction using Trigram "; head(trigram[trigram$word1 == xs[1] & trigram$word2 == xs[2], 3],1)}
  }
  else if (length(xs) == 1){
    xs <- tail(xs,1)
    if (identical(character(0),head(bigram[bigram$word1 == xs[1], 2],1))) {mesg<<-"No word found. -THE- is word returned"; head("the",1)}
    else {mesg <<- "Prediction using Bigram "; head(bigram[bigram$word1 == xs[1],2],1)}
  }
}

shinyServer(function(input, output) {
    output$prediction <- renderPrint({
    result <- predictNextWord(input$inputString)
    output$phrase2 <- renderText({mesg})
    result
  });
  
  output$phrase1 <- renderText({
    input$inputString});
}
)

