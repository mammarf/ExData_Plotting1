## reading in and formatting the data
library(data.table)
project1data = fread("p1data.txt", sep = ";" , header = TRUE, na.strings = "?", stringsAsFactors = FALSE, data.table = FALSE)
project1data = subset(project1data, Date == "1/2/2007" | Date =="2/2/2007")
##creadted a new variable DateandTime
project1data$DateandTime = paste(project1data$Date,project1data$Time, sep = " ")
project1data$DateandTime = strptime(project1data$DateandTime, format = "%d/%m/%Y %H:%M:%S")

##plotting 2
plot(project1data$DateandTime,project1data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

##saving plot2
library(datasets)
dev.copy(png, file = "plot2.png")
dev.off()
