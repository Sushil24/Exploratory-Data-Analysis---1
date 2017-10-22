##data acquisition and cleaning

master<- read.table("household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors = FALSE,dec = ".")
master$Date<- as.character(master$Date)
active<- subset(master, master$Date==c("1/2/2007","2/2/2007"))
active$Global_active_power<- as.numeric(active$Global_active_power)
active$Date<-as.Date(active$Date, "%d/%m/%Y")
date1<- paste(active$Date, active$Time, sep=" ")
new_date<- strptime(date1,"%Y-%m-%d %H:%M:%S")
active$Sub_metering_1<- as.numeric(active$Sub_metering_1)
active$Sub_metering_2<- as.numeric(active$Sub_metering_2)
active$Sub_metering_3<- as.numeric(active$Sub_metering_3)
active$Voltage<- as.numeric(active$Voltage)
active$Global_reactive_power<-as.numeric(active$Global_reactive_power)

##Plotting and copying to graphic device


par(mfrow=c(2,2))
plot(new_date,active$Global_active_power, type="l", xlab="", ylab = "Global Active Powers")
plot(new_date,active$Voltage, type="l", xlab="datetime",ylab="Voltage")
plot(new_date,active$Sub_metering_1, type="l", xlab="", ylab = "Energy Sub metering")
lines(new_date,active$Sub_metering_2, type="l", col= "red")
lines(new_date,active$Sub_metering_3, type="l", col= "blue")
plot(new_date,active$Global_reactive_power,type="l",xlab = "datetime", ylab = "Global_reactive_power")
dev.copy(png,"plot4.png")
dev.off()