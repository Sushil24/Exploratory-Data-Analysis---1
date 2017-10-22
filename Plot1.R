##data acquisition and cleaning

master<- read.table("household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors = FALSE,dec = ".")
master$Date<- as.character(master$Date)
active<- subset(master, master$Date==c("1/2/2007","2/2/2007"))
active$Global_active_power<- as.numeric(active$Global_active_power)

##Plotting and copying to graphic device
par(mfrow=c(1,1))
hist(active$Global_active_power,col="red", main = "Global Active Power", xlab = "Global Active Powers(Kilowatts)", ylab = "Frequency")
dev.copy(png,"plot1.png")
dev.off()
