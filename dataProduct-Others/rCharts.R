#see http://ramnathv.github.io/rCharts/

library(rCharts)
library(reshape2)

## Base Example 1 Facetted Scatterplot
names(iris) = gsub("\\.", "", names(iris))
rEx1=rPlot(SepalLength ~ SepalWidth | Species, data = iris, color = 'Species', type = 'point')
# rEx1$print("chart1") #to generate the html code, chart1 is just a name for output chart
rEx1

## Base Example 2 Facetted Barplot
hair_eye = as.data.frame(HairEyeColor)
rPlot(Freq ~ Hair | Eye, color = 'Eye', data = hair_eye, type = 'bar')

#NVD3 is one of the best general purpose, simplified d3 lib
hair_eye_male = subset(as.data.frame(HairEyeColor), Sex == "Male")
n1 = nPlot(Freq ~ Hair, group = "Eye", data = hair_eye_male, type = "multiBarChart")
n1

#leaflet - great for maps
map1 = Leaflet$new()
map1$setView(c(51.505, -0.09), zoom = 13)
map1$marker(c(51.5, -0.09), bindPopup = "<p> Hi. I am a popup </p>")
map1$marker(c(51.495, -0.083), bindPopup = "<p> Hi. I am another popup </p>")
map1

#Morris for time series
data(economics, package = "ggplot2")
econ = transform(economics, date = as.character(date))
m1 = mPlot(x = "date", y = c("psavert", "uempmed"), type = "Line", data = econ)
m1$set(pointSize = 0, lineWidth = 1)
m1

#polycharts - based on gg plot grammer
p1 = rPlot(mpg ~ wt | am + vs, data = mtcars, type = "point", color = "gear")
p1

#Rickshaw, another one for time series
usp = reshape2::melt(USPersonalExpenditure)
# get the decades into a date Rickshaw likes
usp$Var2 = as.numeric(as.POSIXct(paste0(usp$Var2, "-01-01")))
r1 = Rickshaw$new()
r1$layer(value ~ Var2, group = "Var1", data = usp, type = "area", width = 560)
# add a helpful slider this easily; other features TRUE as a default
r1$set(slider = TRUE)
r1

#xCharts - yet another general purpose d3 spinoff
uspexp = melt(USPersonalExpenditure)
names(uspexp)[1:2] = c("category", "year")
x1 = xPlot(value ~ year, group = "category", data = uspexp, type = "line-dotted")
x1

#HighCharts - good for combining various charts
h1 = hPlot(x = "Wr.Hnd", y = "NW.Hnd", data = MASS::survey, type = c("line", "bubble", "scatter"), group = "Clap", size = "Age")
h1

#publish on gist / rpubs
r1$publish('plotName', host = 'gist')
r1$publish('plotName', host = 'rpubs')

#can also deploy as shiny app / slidify. see shiny / slidify parts