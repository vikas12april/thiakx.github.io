library(yhatr)

#main model
fit = lm(Petal.Width ~ Sepal.Length + Sepal.Width + Petal.Length, data=iris)

model.require = function() {
  #put libs here if needed: library(randomForest)
}

model.transform = function(data){
  data
}

model.predict = function(data) {
  pred = predict(fit, newdata=data.frame(data))
  result = data.frame(pred)
  print(pred)
}

#test model locally
testcase = data.frame(iris[1,1:3])
model.predict(model.transform(testcase))

#config to deploy model
yhat.config = c(
  username='yourUserName',
  apikey='yourAPI',
  env="http://cloud.yhathq.com/"
)

#deploy to yhat server
yhat.deploy ("LinearModelR")

#we can now call the model using rest API
newData = fromJSON('{"Sepal.Length":5.1,"Sepal.Width":4.5,"Petal.Length":2.4}')
yhat.predict("LinearModelR",newData)
