## Capstone: Coursera Data Science
## Final Project
## joseantonio

# SHINY SERVER 
library(shiny); library(stringr); library(tm)

# Loading bigram, trigram and quadgram frequencies words matrix frequencies
bg <- readRDS("bigram.RData"); tg <- readRDS("trigram.RData"); qd <- readRDS("quadgram.RData")

names(bg)[names(bg) == 'word1'] <- 'w1'; names(bg)[names(bg) == 'word2'] <- 'w2';
names(tg)[names(tg) == 'word1'] <- 'w1'; names(tg)[names(tg) == 'word2'] <- 'w2'; names(tg)[names(tg) == 'word3'] <- 'w3';
names(qd)[names(qd) == 'word1'] <- 'w1'; names(qd)[names(qd) == 'word2'] <- 'w2'; names(qd)[names(qd) == 'word3'] <- 'w3'
names(qd)[names(qd) == 'word4'] <- 'w4';
message <- "" ## cleaning message

## Function predicting the next word
predictWord <- function(the_word) {
        word_add <- stripWhitespace(removeNumbers(removePunctuation(tolower(the_word),preserve_intra_word_dashes = TRUE)))
        # testing print("word_add")
        the_word <- strsplit(word_add, " ")[[1]]
        # testing print("the_word")
        n <- length(the_word)
        # testing print(n)
        
        ########### check Bigram
        if (n == 1) {the_word <- tail(the_word,1); functionBigram(the_word)}
        
        ################ check trigram
        else if (n == 2) {the_word <- tail(the_word,2); functionTrigram(the_word)}
        
         ############### check quadgram
        else if (n >= 3) {the_word <- tail(the_word,3); functionQuadgram(the_word)}
}
########################################################################
functionBigram <- function(the_word) {
        if (identical(character(0),head(bg[bg$w1 == the_word[1], 2], 1))) {
                message<<-"If no word found the most used pronoun 'it' in English will be returned" 
                head("it",1)
                }
        else {
                message <<- "Predicting the Word using Bigram Matrix  "
                head(bg[bg$w1 == the_word[1],2], 1)}
}
########################################################################
functionTrigram <- function(the_word) {
        if (identical(character(0),head(tg[tg$w1 == the_word[1]
                                           & tg$w2 == the_word[2], 3], 1))) {
                predictWord(the_word[2])
                }
        else {
                message<<- "Predicting the Word using Trigram Matrix "
                head(tg[tg$w1 == the_word[1]
                        & tg$w2 == the_word[2], 3], 1)}        
}
########################################################################
functionQuadgram <- function(the_word) {
        if (identical(character(0),head(qd[qd$w1 == the_word[1]
                                          & qd$w2 == the_word[2]
                                          & qd$w3 == the_word[3], 4], 1))) {
                predictWord(paste(the_word[2],the_word[3],sep=" "))
                }
        else {
                message <<- "Predicting the Word using Quadgram Matrix"
                head(qd[qd$w1 == the_word[1] 
                        & qd$w2 == the_word[2]
                        & qd$w3 == the_word[3], 4], 1)}       
}
#################################################

## ShineServer code to call the function predictWord
shinyServer(function(input, output) {
        output$prediction <- renderPrint({
                result <- predictWord(input$inputText)
                output$sentence2 <- renderText({message})
                result
                });
        output$sentence1 <- renderText({
                input$inputText});
}
)

