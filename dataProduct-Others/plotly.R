#install plotly
# install.packages("devtools")
# library("devtools")
# install_github("ropensci/plotly")

library(plotly)

#set apikey, only need to do this once, 
#get it by signing up at plotly and going to api settings: https://plot.ly/settings/api
#set_credentials_file("username", "apiKey")

py = plotly()
trace0 = list(
  x = c(1, 2, 3, 4),
  y = c(10, 15, 13, 17)
)
trace1 = list(
  x = c(1, 2, 3, 4),
  y = c(16, 5, 11, 9)
)

#public file
response = py$plotly(trace0, trace1, kwargs=list(filename="basic-line", fileopt="overwrite"))

#private file - world_readable=FALSE
responsePvt = py$plotly(trace0, trace1, kwargs=list(filename="basic-line-pvt", fileopt="overwrite",  world_readable=FALSE))

#returns URL of plot
response$url 
responsePvt$url 