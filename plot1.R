epdata <- tbl_df(read.csv("./data/work_ep.csv"))
with(epdata, hist(Global_active_power, col="red"))
dev.copy(png, "plot1.png")
dev.off()