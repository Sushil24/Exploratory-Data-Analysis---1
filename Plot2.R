##data acquisition and cleaning

master<- read.table("household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors = FALSE,dec = ".")
master$Date<- as.character(master$Date)
active<- subset(master, master$Date==c("1/2/2007","2/2/2007"))
active$Global_active_power<- as.numeric(active$Global_active_power)
active$Date<-as.Date(active$Date, "%d/%m/%Y")
date1<- paste(active$Date, active$Time, sep=" ")
new_date<- strptime(date1,"%Y-%m-%d %H:%M:%S")

##Plotting and copying to graphic device
par(mfrow=c(1,1))
plot(new_date,active$Global_active_power, type="l", xlab="", ylab = "Global Active Powers(Kilowatts)")
dev.copy(png,"plot2.png")
dev.off()
