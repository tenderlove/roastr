argv <- commandArgs(trailingOnly = TRUE)

temps <- read.csv(argv[1], header=TRUE, colClasses=c("POSIXct", "numeric", "logical"), stringsAsFactors=FALSE)

temps$time_as_numeric <- as.numeric(temps$time)

last_100 = tail(temps, n = 150)
# fit <- lm(V2 ~ time_as_numeric, data = temps)
fit <- lm(temp ~ time_as_numeric, data = last_100)

remaining = 71.111 - tail(temps$temp, n=1)

cor(as.numeric(temps$time), temps$temp)
print(remaining / fit$coefficients[2])
print((remaining / fit$coefficients[2]) / 60)

png(argv[2], width = 4000, height=2000, res=300)
plot(0, main="Roast Temperature over Time", type="n", xlab="", ylab="Degrees C", xaxt="n", xlim=c(min(temps$time_as_numeric), max(temps$time_as_numeric)), ylim=c(min(temps$temp), max(temps$temp)))
lines(temps[temps$in_oven==TRUE,]$time, temps[temps$in_oven == TRUE,]$temp, type="p", col="blue", cex=0.2)
lines(temps[temps$in_oven==FALSE,]$time, temps[temps$in_oven == FALSE,]$temp, type="p", col="red", cex=0.2)
axis.POSIXct(1, at = temps$time, format = "%H:%M:%S", las=3)
legend("topleft", legend=c("In Oven", "Not In Oven"),
       col=c("blue", "red"), lty=1:1, cex=0.8,
       title="Roast Inside Oven?", text.font=4)
dev.off()
