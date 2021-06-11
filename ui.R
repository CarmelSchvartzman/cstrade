options(encoding = "UTF-8")

# testing your trading strategies
#install.packages("bslib")

library(shiny)
library(ggplot2)

shinyUI(fluidPage(
  theme = bslib::bs_theme(version = 4, bootswatch = "darkly"),
  
  navbarPage("Trading Tester",
             
             tabPanel("",
  
  
  title = "Home",
  h2("Trading Tester"),
  helpText("Define the settings of a Trade Strategy in order to analyse its Profits"),
  plotOutput('plot'),

  hr(),
  
  fluidRow(
    column(4,
           h4("Stock Symbol"),
           helpText("Select the Company, the time period & the type of graph"),
           br(),
           textInput("symb", label=h5("Company"), "GOOGL"),
           dateRangeInput("dates", 
                          label=h5("Time Period"),
                          start = "2015-01-01",
                         
                          end =   as.character(Sys.Date())),
           checkboxInput("addVo", "Show Volumes", 
                         value = T),
           selectInput("plot_select", label = h5("Plot Style"), 
                       choices = list("Lin" = 1, "Candlestick" = 2), selected = 2),
           br(),
           submitButton('Show the Stock Prices (& see profits)')
    ),
    column(4, 
           h4("Bollinger Bands settings"),
           helpText("Modify the Bollinger's Bands settings"),
           sliderInput("sd", label=h6("# of SD (Sigma)"), min = 1.0, max = 3.2,
                       , value = 2.0, step=0.1),
         
           sliderInput("BB_win", label=h6("Bollinger's Bands Size:"), min = 14, max = 60,
                       , value = 20, step=1),
           checkboxInput("addBB", "Display Bands", value = T),
           br(),
           helpText("Enable this option and click the 'Display' button again in order to calculate the profits"),
           checkboxInput("processed", "Open Positions", value = FALSE),
           checkboxInput("stop_profit", "Stop profits?", value = TRUE),
           numericInput("stop_day", label=h6("Period of holding (in days):"), 
                        value=365, min =1, step = 1),
           sliderInput("stop_trig", label=h6("Trigger to Stop Sell"), min = 0, max = 0.15, value = 0.0, step=0.001)
    ),
    column(4,
           h4('MACD'),
           helpText('Moving average convergence divergence (MACD) is a 
                    trend-following momentum indicator that shows the relationship between two moving averages'),
           
           sliderInput("macd_fast", label=h6("Fast Indicator:"), min = 7, max = 60,
                       , value = 12, step=1),
           sliderInput("macd_slow", label=h6("Slow Indicator:"), min = 20, max = 150,
                       , value = 26, step=1),
           sliderInput("macd_signal", label=h6("Signal:"), min = 5, max = 60,
                       , value = 9, step=1), 
           checkboxInput("addMACD", "Display MACD", value = T),
           checkboxInput("modi_macd", "Modify the opened positions according to
                         MACD (enable the Trigger to Stop Sell).", value = FALSE)
    )
  ),
  HTML("<a  href = 'https://carmelsoft.netlify.app/'
                                        target = '_blank'
                                         style='font:900 12px Comic Sans MS;color:#fff;'  >by CarmelSoft</a>"),
  
 
  hr(),
  
  h6('The statement and analysis in this website is provided for educative purposes and as general information for      illustrative purpose only. This app does not intend to provide invesment advice. You understand and acknowledge that there is a very high      degree of risk involved in trading securities and/or currencies. The author assumes no      responsibility or liability for your trading and investment results.')
  
  
             ),  
  
  tabPanel("Instructions", 
           titlePanel("Instructions"), 
           div(includeMarkdown("explanation.md"), 
               align="justify")
  )  ,  
  
  tabPanel("About", 
           titlePanel("About"), 
           div(includeMarkdown("about.md"), align="justify"),
           HTML("<a  href = 'https://carmelsoft.netlify.app/'
                    target = '_blank'
                    style='font:900 12px Comic Sans MS;color:#fff;'  >by CarmelSoft</a>")
           
           
           
  )  
  
  )
  
  
  
  
  
  

  
  
  
  
  
  
  
  
  
  
  
  
  ))
