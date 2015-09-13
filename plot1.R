plot1 <- function() {
    gap <- readGapData()
    plotGapData(gap)
}

readGapData <- function() {
    data <- read.csv("household_power_consumption.txt",sep = ";")
    gap <-
        data$Global_active_power[data$Date == "1/2/2007" |
                                     data$Date == "2/2/2007"]
    gap
}

plotGapData <- function(data) {
    convertedToDoubles <- as.double(as.character.numeric_version(data))
    png(filename = "plot1.png")
    hist(
        convertedToDoubles,col = 'red',xlab = "Global Active Power (kilowatts)", main = "Global Active Power"
    )
    dev.off()
}
