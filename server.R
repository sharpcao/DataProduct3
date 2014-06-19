library(quantmod)

stkid <- '^SSEC'
stksb <- NULL
stk <- NULL

updateData <- function(id)
{
  try({
  stksb <<- getSymbols(id)
  stk <<- data.frame(dt=time(eval(as.symbol(stksb))), Close=as.numeric(eval(as.symbol(stksb))[,4]))  
  stk$year <<- format(stk$dt,"%Y")
  stk$ym <<- format(stk$dt,"%Y-%m")
  })
}

updateData(stkid)

shinyServer(
  function(input, output){
    
    
    output$oPlot <- renderPlot(
    {
      
      dt1 <- input$idt1
      dt2 <- input$idt2
      tp <- input$ird_type
      lg <- ifelse(input$ick_log,"y","");
      
      ss <- stk$dt >= as.Date(dt1) & stk$dt <= as.Date(dt2)
     
      if (tp=="Day") {
          plot(Close~dt,data=stk[ss,],type="b",pch=19,xlab="",ylab="index",log=lg)
      }else if(tp =="Month"){
          boxplot(Close~ym,data = stk[ss,],log=lg)
      }else if(tp =="Year"){
          boxplot(Close~year,data = stk[ss,],log=lg)
      }
          
    }  
    )
    
  }
)