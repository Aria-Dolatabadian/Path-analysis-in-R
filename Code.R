#install.packages("lavaan")
#install.packages("OpenMx")
#install.packages("semPlot")
#install.packages("GGally")
#install.packages("corrplot")
library(lavaan)
library(semPlot)
library(OpenMx)
library(GGally)
library(corrplot)

data <- read.csv("data.csv")

head(data, n = 10)

cor1 = cor(data)
corrplot(cor1, method = 'square')

model1 = 'Z ~ x1 + x2 + x3 + Y
Y ~ x1 + x2'
fit1 = cfa(model1, data = data)
summary(fit1, fit.measures = TRUE, standardized = TRUE, rsquare = TRUE)

semPaths(fit1, 'std', layout = 'circle')

# Let's take second example where we take standard dataset 'mtcars' available in R


data2 <- read.csv("mtcars.csv")
head(data2, n = 10)

model2 = 'mpg ~ hp + gear + cyl + disp + carb + am + wt
hp ~ cyl + disp + carb'
fit2 = cfa(model2, data = data2)

summary(fit2)

semPaths(fit2, 'std', 'est', curveAdjacent = TRUE, style = "lisrel")

