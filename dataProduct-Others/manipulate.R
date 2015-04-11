#guide: https://support.rstudio.com/hc/en-us/articles/200551906-Interactive-Plotting-with-Manipulate

library(manipulate)

#non interactive
plot(cars, xlim=c(0,25))

#interactive with slider
manipulate(
  plot(cars, xlim=c(0,x.max)),  
  x.max=slider(15,25))

#picker
manipulate(
  barplot(as.matrix(longley[,factor]), 
          beside = TRUE, main = factor),
  factor = picker("GNP", "Unemployed", "Employed"))

#checkbox
manipulate(
  boxplot(Freq ~ Class, data = Titanic, outline = outline),
  outline = checkbox(FALSE, "Show outliers"))

#multiple controls
manipulate(
  plot(cars, xlim = c(0, x.max), type = type, ann = label),
  x.max = slider(10, 25, step=5, initial = 25),
  type = picker("Points" = "p", "Line" = "l", "Step" = "s"),
  label = checkbox(TRUE, "Draw Labels"))
