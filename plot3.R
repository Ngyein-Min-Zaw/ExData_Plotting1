epdata <- tbl_df(read.csv("./data/work_ep.csv"))
epdata$Date <- as.Date(epdata$Date, format="%d/%m/%Y")
epdata$dateandtime <-  as.POSIXct(paste(as.Date(epdata$Date, format = "%d/%m/%Y"), epdata$Time))
with(epdata, plot(dateandtime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(epdata, lines(dateandtime, Sub_metering_2, col="red"))
with(epdata, lines(dateandtime, Sub_metering_3, col="blue"))
legend("topright", lty = 1, col=c("black","red","blue"), legend = colnames(epdata[,8:10]))
dev.copy(png, "plot3.png", height = 480, width = 600) #mine work only at width = 600
dev.off()
