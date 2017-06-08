library(shiny)
require(stats)

data("esoph")
esoph_prediction <- function(age, alc, tob){
  
  mca <- lm(ncases ~ unclass(agegp) + unclass(tobgp) + unclass(alcgp), data = esoph)
  mco <- lm(ncontrols ~ unclass(agegp) + unclass(tobgp) + unclass(alcgp), data = esoph)
  
  
  nca<- mca$coefficients[1]+ mca$coefficients[2]*age+ mca$coefficients[3]*alc+ mca$coefficients[4]*tob
  nco<- mco$coefficients[1]+ mco$coefficients[2]*age+ mco$coefficients[3]*alc+ mco$coefficients[4]*tob
  es_prob<- round((nca/(nca+nco))*100,  digits= 2)
  if ( es_prob>= 100 )
    es_prob<- 99.00
  else if (es_prob< 0)
    es_prob<- 0.00
  return(es_prob)
  
}


shinyServer(
  function(input, output){
    output$inputValues <- renderPrint({paste("Age: ", input$age, "Alcohol CCs/day: ", input$alc, "Somking grams/day: ", input$tob)})
    output$es_prob <- renderPrint({paste(esoph_prediction(as.numeric(input$age), as.numeric(input$alc), as.numeric(input$tob)), "%")})             
    
  }
)


