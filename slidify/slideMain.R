library(slidify)

#set path to deck here
setwd("~/Documents/coursera/developing data product/slidify/slidify-demo")
slidify("index.Rmd")
runDeck() #note: may need to install.packages('XML') #note2: 

# browseURL("index.html") #won't work for shiny apps that need server, use runDeck() instead

##to initialize the deck
# setwd("yourpath")
# author("slidify-demo")

## publish to git hub
#publish_github(user,repo)
