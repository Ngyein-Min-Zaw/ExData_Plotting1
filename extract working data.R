library(dplyr)
library(lubridate)
#download the data file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
data_path <- "./data/"
download.file(url,"./data/EPcom.zip")
unzip("./data/EPcom.zip", exdir=data_path)
dir("./data")
#read the data file
#ep <- tbl_df(read.table("./data/household_power_consumption.txt", sep = ";", colClasses=c("Date","Time", "Integer", "Integer", "Integer", "Integer", "Integer", "Integer", "Integer")))
ep <- tbl_df(read.table("./data/household_power_consumption.txt", sep = ";"))
names(ep) <- ep[1,]
ep<-ep[-1,]
work_ep <- ep%>%filter(Date=="2007-02-01" | Date == "2007-02-02")

#work_ep$Global_active_power <- as.numeric(work_ep$Global_active_power)
#work_ep$Global_reactive_power <- as.numeric(work_ep$Global_reactive_power)
#work_ep$Voltage <- as.numeric(work_ep$Voltage)
#work_ep$Global_intensity <- as.numeric(work_ep$Global_intensity)
write.csv(work_ep, "./data/work_ep.csv")
