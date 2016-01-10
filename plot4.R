## reading in and formatting the data
library(data.table)
project1data = fread("p1data.txt", sep = ";" , header = TRUE, na.strings = "?", stringsAsFactors = FALSE, data.table = FALSE)
project1data = subset(project1data, Date == "1/2/2007" | Date =="2/2/2007")
##creadted a new variable DateandTime
project1data$DateandTime = paste(project1data$Date,project1data$Time, sep = " ")
project1data$DateandTime = strptime(project1data$DateandTime, format = "%d/%m/%Y %H:%M:%S")

##Plotting 4
par(mfrow = c(2,2))
with(project1data, {
    plot(DateandTime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "n" )
    lines(DateandTime, Global_active_power)
    plot(DateandTime, Voltage, xlab= "datetime", ylab = "Voltage", type = "n")
    lines(DateandTime, Voltage)
    plot(DateandTime, Sub_metering_1, xlab = "", ylab = "Global Active Power (kilowatts)", type = "n" )
    lines(DateandTime, Sub_metering_1, col = "black")
    lines(DateandTime, Sub_metering_2, col = "red")
    lines(DateandTime, Sub_metering_3, col = "blue")
    legend("topright", lty = 1, legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), bty = "n", xjust = 1)
    plot(DateandTime, Global_reactive_power, xlab= "datetime", ylab = "Global_reactive_power", type = "n")
    lines(DateandTime, Global_reactive_power)
})

##saving plot
dev.copy(png, file = "plot4.png")
dev.off()
