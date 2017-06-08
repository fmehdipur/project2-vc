
library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel('Prediction of Ensophageal Cancer'),
  sidebarPanel(
    h3('Enter your information'),
    p('Choose your age group, amount of alcohol and tobacco consumed in grams per day'),             
    radioButtons('age', 'Your age group:', c('25-34 yo' = 1, '35-44 yo' = 2, '45-54 yo' = 3, '55-64 yo'= 4, '65-74 yo'= 5, '75+ yo'= 6), selected = 1), 
    radioButtons('alc', 'Alcohol consumption:', c('0-39 g/day' = 1, '40-79 g/day' = 2, '80-119 g/day' = 3, '120+ g/day'= 4 ), selected= 1), 
    radioButtons('tob', 'Tobaco consumption:', c('0-9 g/day' = 1, '10-19 g/day' = 2, '20-29 g/day' = 3, '30+ g/day'= 4), selected = 1),
    submitButton('Submit')
  ),
  
  mainPanel(
    h4('Developed by Farhad Mehdipour'),
    h4('The data entered:'),
    verbatimTextOutput("inputValues"),
    
    h4('Predicted probability:'),
    h5('NOTE: a probability of 0 means that the model is not able to predict with sufficient accuracy.'),
    verbatimTextOutput("es_prob"),
    
    h3('Method of prediction'),
    p('The data is borrowed from a study of (o)esophageal cancer in Ille-et-Vilaine, France. 
      It is a case-control study which investigates the impact of various age groups for different 
      amount of alcohol and tobacco consumption per day. 
      In this tool, we fit a linear model to the esoph dataset for modeling the effect of above parameters
      on the probability of getting esophageal cancer. 
      User should choose among various age groups and alcohol and tobaco consumption
      and get the probability value as the output.'),
    
    h4('Source'),
    p('Breslow, N. E. and Day, N. E. (1980) Statistical Methods in Cancer Research. Volume 1: The Analysis of Case-Control Studies. IARC Lyon / Oxford University Press.')
    )
  ))
