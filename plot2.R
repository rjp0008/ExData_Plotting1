plot2 <- function() {
    data <- readData()
    makePlot(data)
}

readData <- function() {
    powerData <- read.csv("household_power_consumption.txt",sep = ";")
    sub <- subset.data.frame(powerData,powerData$Date == "1/2/2007" |
                                 powerData$Date == "2/2/2007")
    sub
}

makePlot <- function(data){
    png(filename = "plot2.png")
    plot(strptime(paste(sub$Time,sub$Date),format="%H:%M:%S %d/%m/%Y"),as.character.numeric_version(sub$Global_active_power),type="l",xlab="",ylab = "Global Active Power (kilowatts)")
    dev.off()
}
