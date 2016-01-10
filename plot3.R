## reading in and formatting the data
library(data.table)
project1data = fread("p1data.txt", sep = ";" , header = TRUE, na.strings = "?", stringsAsFactors = FALSE, data.table = FALSE)
project1data = subset(project1data, Date == "1/2/2007" | Date =="2/2/2007")
##creadted a new variable DateandTime
project1data$DateandTime = paste(project1data$Date,project1data$Time, sep = " ")
project1data$DateandTime = strptime(project1data$DateandTime, format = "%d/%m/%Y %H:%M:%S")

##plotting 3
library(datasets)
plot(project1data$DateandTime, project1data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy Sub Metering")
lines(project1data$DateandTime, project1data$Sub_metering_1, col = "black")
lines(project1data$DateandTime, project1data$Sub_metering_2, col = "red")
lines(project1data$DateandTime,project1data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))

##saving plot 3
dev.copy(png, file = "plot3.png")
dev.off()
