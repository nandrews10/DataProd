#setwd("C:/Users/Naveen Andrews/Desktop/Developing-Data-Products/RegUpload") 
getwd()
dir("./") #Shows directory contents

library(shiny)

fig.width <- 600
fig.height <- 450

shinyUI(pageWithSidebar(
  
  headerPanel("Investigation of relationship between variables using Single Regression"),
   
  
  
  sidebarPanel(
    
    div(p("**DOCUMENTATION about HOW TO USE:")),
    
    div(p("**Least Squares Minimization utilized to find slope and intercept.")),
    
    div(p("**Steps:
          (1).  Observe the points and get an intuitive idea for slope and intercept
          (2).  Slide the slope and intercept bars to confirm your intuition
          (3).  Notice the Sum of Squares of Residuals pane:  Minimum Sum of Squares is X ")),
    
    div(p("**Slide the bars and observe your SumSqResiduals (O) with Minimun(X)")),
    
    div(p("**CODE--in https://github.com/ncandrews/DataProd")),
    
    
    div(
      
      sliderInput("intercept",
                  strong("Intercept"),
                  min=-2, max=6, step=.5,
                  value=sample(seq(-2, 6, .5), 1), ticks=FALSE),
      br(),
      sliderInput("slope", 
                  strong("Slope"),
                  min=-1, max=3, step=.25, 
                  value=sample(seq(-1, 3, .25), 1), ticks=FALSE),
      br(),
      checkboxInput("summary",
                    strong("Show summary(lm(y ~ x)):  Scroll Down"),
                    value=FALSE)
      
    )
  ),
  
  mainPanel(
    div(plotOutput("reg.plot", width=fig.width, height=fig.height),
        title="y = 2 + x"),
    div(plotOutput("ss.plot", width=fig.width, height=fig.height / 3)),
    div(plotOutput("resid.plot", width=fig.width, height=fig.height / 2)),
    div(class="span7", conditionalPanel("input.summary == true",
                                        p(strong("Linear model summary")),
                                        verbatimTextOutput("summary")))
  )
  
))
