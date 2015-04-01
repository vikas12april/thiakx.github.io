#from shiny tutorial: http://shiny.rstudio.com/tutorial/

#make sure the libs are is intalled: "shiny","maps", "mapproj", "shinyapps"

#setwd("yourpath")
library(shiny)

#examples
#runExample("01_hello") # a histogram
# runExample("02_text") # tables and data frames
# runExample("03_reactivity") # a reactive expression
# runExample("04_mpg") # global variables
# runExample("05_sliders") # slider bars
# runExample("06_tabsets") # tabbed panels
# runExample("07_widgets") # help text and submit buttons
# runExample("08_html") # Shiny app built from HTML
# runExample("09_upload") # file upload wizard
# runExample("10_download") # file download wizard
# runExample("11_timer") # an automated timer

#simple app
runApp("simple")

#app with widgets
runApp("census")

#stock market app
runApp("stockVis")

#deploy apps to shinyapps.io
library(shinyapps)
shinyapps::deployApp('simple')
shinyapps::deployApp('census')
shinyapps::deployApp('stockVis')

#run from github
runGitHub("stockVisDemo", "thiakx") 
