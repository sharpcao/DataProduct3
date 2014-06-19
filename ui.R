shinyUI(
  
  
  pageWithSidebar (
    headerPanel("Shanghai Index"),
    sidebarPanel(
      dateInput("idt1","Date From:","2007-1-4",min="2007-1-4"),
      dateInput("idt2","Date To:","2014-6-18",min="2007-1-5"),
      radioButtons("ird_type","Plot Type",c("Year"="Year","Month"="Month","Day"="Day")),
      checkboxInput("ick_log","Y-Log",value=F)
    ),
    
    mainPanel(
      #verbatimTextOutput("odt1"),
      #verbatimTextOutput("odt2"),
      plotOutput("oPlot")
      
      
    )
      
  )
)