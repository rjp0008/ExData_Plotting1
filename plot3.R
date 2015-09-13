plot3 <- function() {
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
    png(filename = "plot3.png")
    plot(strptime(paste(sub$Time,sub$Date),format="%H:%M:%S %d/%m/%Y"),as.character.numeric_version(sub$Sub_metering_1),type="l",xlab="",ylab = "Energy sub metering")
    lines(strptime(paste(sub$Time,sub$Date),format="%H:%M:%S %d/%m/%Y"),y = as.character.numeric_version(sub$Sub_metering_2),col="red")
    lines(strptime(paste(sub$Time,sub$Date),format="%H:%M:%S %d/%m/%Y"),y = as.character.numeric_version(sub$Sub_metering_3),col="blue")
    legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1))
       dev.off()
}
