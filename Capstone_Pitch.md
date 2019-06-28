Coursera Data Science Capstone - Course Project
========================================================
author: Anthony Iannolo
date: June 28, 2019
autosize: true


Background
========================================================

<large>- This Capstone project was focused on understanding and building predictive text models in the Data Science area of Natural Language Processing (NLP).  NLP encompassess how to program computers to process and analyze large amounts of language data.

- The project requirement was to build a shiny application that accepts a user input phrase and predicts the next word.

- This presentation describes the pre-processing performed to develop meta-data for the application, the algorithm used in the application to predict the next word, and instructions on how to use the application.

</large>



Processing the Corpus
========================================================
<small>- The Corpus was read into R which consisted of downloaded Blogs, News and Twitter data.  Additional basic exploratory analysis was performed including: file-sizes, number of lines, lines with information, number of characters, non-blank characters, number of words and histograms of most commonly occurring words

- Next, the corpus was cleaned by performing the following: convert to lower-case, remove punctuation marks, remove numbers, special characters and white-space.

- The next major step required was to perform Tokenization of the corpus and build n-grams.  In this process bigrams, trigrams and quadgrams were created; which are two, three and four word sequences from the corpus.

- The ngrams were sorted based on frequency of occurence and saved as the key data input for the shiny application.

</small>

Shiny Application Description
========================================================
<small>-The shiny application consists of a ui (user interface) and server component.  This shiny application takes as input a phrase (from ui) in a text box and outputs a prediction of the next word based on logic within the server component.

The server code leverages the ngram files (bigrams, trigrams and quadgrams) and a back-off algorithm to predict the next word as described below:

- To predict the next word, the quadgram is compared (are first three words of quadgram equal to last three words of user input).

- If no quadgram is matched, back off to trigram (are first two words of trigram equal to the last two words of user input).

- If no trigram is matched, back off to bigram (is first word of bigram is equal to the last word of user input).

- If no Bigram is found, back off to the most common word.

</small>

Application Instructions
========================================================
<small>- The application is driven by a main panel called "Word Prediction".

- The Word Prediction panel has a side panel where user input is entered in a text iput box titled "Enter words here".
- As the user is typing, the predicted next word is shown in a text output box with a title above noting "Word prediction is displayed here".

- An additional tab panel called "Applicaiton Info" contains background information on the applicaiton.</large>

<small>
Links:


- The application is hosted in shiny and can be accessed at the following link:
https://anthonyiannolo.shinyapps.io/Predict_Words/

- The shiny application ui and server code is located in guthub at the following link:
https://github.com/AnthonyIannolo/Coursera_Data_Products_Project

</small>
