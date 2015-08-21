library(UsingR)
library(caret)

shinyServer(
    function(input, output) {
        lm <- lm(mpg ~ cyl+hp+wt, data=mtcars)
        
        output$pred <- renderText({
            input$goButton
            
            isolate(lm$coef[1] + lm$coef[2]*as.numeric(input$cyl) + lm$coef[3]*as.numeric(input$hp) + 
                        lm$coef[4]*as.numeric(input$wt))
        })
    }
)