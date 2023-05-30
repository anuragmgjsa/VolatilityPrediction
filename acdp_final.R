library("ACDm")

data <- read.csv("C:\\Users\\dell\\OneDrive\\Documents\\data1.csv")
data <- na.omit(data)

a <- acdFit(durations =data , model = "ACD", dist = "weibull",order = c(1,1),optimFnc = "solnp")
summary (a)
head(fitted(a))
a
b <- residuals(a)
coef(a, returnCoef = "all")
write.csv(b,"C:\\C:\\Users\\dell\\OneDrive\\Documents\\residual.csv")
# write the residual to csv file
# open excel file write all the residuals 
print(a)
data <- read.csv("C:\\Users\\dell\\OneDrive\\Documents\\data2.csv")
data <- as.POSIXct(as.numeric(as.character(data$time)),origin="1970-01-01")
durDataShort <- computeDurations(data,open = "01:00:00", close = "18:25:00", rm0dur = TRUE, type = "trade", priceDiff = .00, cumVol = 0)
write.csv(durDataShort,"C:\\Users\\dell\\OneDrive\\Documents\\dur.csv")
