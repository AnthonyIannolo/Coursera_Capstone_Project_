#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Coursera Data Science Capstone Project
# Anthony Iannolo
# June 22 2019
#
# This shiny application takes as input a phrase in a text box and outputs a prediction of the next word.
# The model leverages a back-off algorithm to predict the next word as described in the server component.
#
# The user component below provides a text box for input and displays the predicted word returned from the model.
# An additional panel provides background on the application.
#
suppressWarnings(library(shiny))
suppressWarnings(library(markdown))

shinyUI(navbarPage("Coursera Data Science Capstone Project",
                   tabPanel("Word Prediction",
                            # Sidebar
                                br(),
                                br(),
                            sidebarLayout(
                              sidebarPanel(
                                helpText("Use the text box below to enter your sentence."),
                                textInput("inputString", "Enter words here:",value = ""),
                                br(),
                                br(),
                                br(),
                                br()
                              ),
                              mainPanel(
                                br(),
                                br(),
                                h2("Word prediction is displayed here:"),
                                verbatimTextOutput("wordprediction"),
                                br()
                              )
                            )
                            
                   ),
                   tabPanel("Application Info",
                            mainPanel(
                              h2("Coursera Data Science Capstone Project"),
                              br(),
                              h4("This application takes in a phrase and outputs a prediction of the next word.  
                                 To construct this application, preprocessing of a supplied Corpus
                                 was performed."),
                              h4("The Corpus included blog, news and twitter data.  N-grams, sequences of words
                                  from the corpus, were also generated with the most frequently ocurring saved."),
                              h4("This application leverages the saved n-Grams along with a back-off algorithm to predict
                                 the next word the user enters."),
                              br(),
                              h5("Anthony Iannolo - June 22, 2019")
                              
                            )
                   )
)
)