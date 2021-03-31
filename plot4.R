setwd("C:/Users/utkarsh/Desktop/coursera/Exploratory")
data_full <- read.csv("householdpowerconsumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data1, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="GlobalActivePower (kW)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Submeter1~Datetime, type="l", 
       ylab="GlobalActivePower (kW)", xlab="")
  lines(Submeter2~Datetime,color='Red')
  lines(Submeter3~Datetime,color='Blue')
  legend("topright", color=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Submeter1", "Submeter2", "Submeter3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="GlobalReactivePower (kW)",xlab="")
})
