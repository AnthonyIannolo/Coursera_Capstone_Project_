#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Coursera Data Science Capstone Project
# Anthony Iannolo
# June 22 2019
#
# This shiny application takes as input a phrase in a text box and outputs a prediction of the next word.
# The model leverages a back-off algorithm to predict the next word as described below in this server component.
#
# Load the required packages

suppressWarnings(library(stringr))
suppressWarnings(library(tm))
suppressWarnings(library(shiny))

# Read in the bigram,trigram & quadgram data

bigram <- readRDS("bi_gram.RData");
trigram <- readRDS("tri_gram.RData");
quadgram <- readRDS("quad_gram.RData");


# Clear user input before starting on next word

Nextword<- function(x) {
  inputclear <- removeNumbers(removePunctuation(tolower(x)))
  input <- strsplit(inputclear, " ")[[1]]
  
# Description of Back-off alogorithm used to predict the next word
# To predict the next word, the Quadgram is first compared (first three words of Quadgram is 
#    equivalent to last three words of the user input).
# If no Quadgram is matched, back off to Trigram (first two words of Trigram is 
#    equivalent to the last two words of user input).
# If no Trigram is matched, back off to Bigram (first word of Bigram is equivalent to the last word of user input)
# If no Bigram is found, back off to the most common word 'the'.
  
  if (length(input)>= 3) {
    input <- tail(input,3)
    if (identical(character(0),head(quadgram[quadgram$unigram == input[1] & 
                                             quadgram$bigram == input[2] & quadgram$trigram == input[3], 4],1))){
      Nextword(paste(input[2],input[3],sep=" "))
    }
    else {head(quadgram[quadgram$unigram == input[1] & quadgram$bigram == input[2] & 
                                             quadgram$trigram == input[3], 4],1)}
  }
  else if (length(input) == 2){
    input <- tail(input,2)
    if (identical(character(0),head(trigram[trigram$unigram == input[1] & 
                                            trigram$bigram == input[2], 3],1))) {
      Nextword(input[2])
    }
    else {head(trigram[trigram$unigram == input[1] & trigram$bigram == input[2], 3],1)}
  }
  else if (length(input) == 1){
    input <- tail(input,1)
    if (identical(character(0),head(bigram[bigram$unigram == input[1], 2],1))) {head("the",1)}
    else {head(bigram[bigram$unigram == input[1],2],1)}
  }
}

# Output the results of the prediction

shinyServer(function(input, output) {
  output$wordprediction <- renderPrint({
    result <- Nextword(input$inputString)
    result
  });
  
}
)