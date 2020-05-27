epdata <- tbl_df(read.csv("./data/work_ep.csv"))
epdata$Date <- as.Date(epdata$Date, format="%d/%m/%Y")
epdata$dateandtime <-  as.POSIXct(paste(as.Date(epdata$Date, format = "%d/%m/%Y"), epdata$Time))
par(mfcol=c(2,2))
#_________
plot(epdata$dateandtime, epdata$Global_active_power, type='l', xlab="", ylab = "Global Active Power (kilowatts)")
#++++++++++
with(epdata, plot(dateandtime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(epdata, lines(dateandtime, Sub_metering_2, col="red"))
with(epdata, lines(dateandtime, Sub_metering_3, col="blue"))
legend("topright", lty = 1, col=c("black","red","blue"), legend = colnames(epdata[,8:10]), cex=0.5)
#____________
plot(epdata$dateandtime, epdata$Voltage, type='l', xlab="datetime", ylab = "Voltage")
#__________\
plot(epdata$dateandtime, epdata$Global_reactive_power, type='l', xlab="datetime", ylab = "Global_reactive_power")
dev.copy(png,"plot4.png")
dev.off()
