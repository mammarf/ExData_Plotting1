## reading in and formatting the data
library(data.table)
project1data = fread("p1data.txt", sep = ";" , header = TRUE, na.strings = "?", stringsAsFactors = FALSE, data.table = FALSE)
project1data = subset(project1data, Date == "1/2/2007" | Date =="2/2/2007")
##creadted a new variable DateandTime
project1data$DateandTime = paste(project1data$Date,project1data$Time, sep = " ")
project1data$DateandTime = strptime(project1data$DateandTime, format = "%d/%m/%Y %H:%M:%S")

##plotting 1
hist(project1data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

##saving plot 1
library(datasets)
dev.copy(png, file = "plot1.png")
dev.off()
