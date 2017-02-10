source("load_data.R")

data <- loadData()

png(
	filename="plot2.png",
	width=560,
	height=480,
	units="px"
)

datetime <- paste(as.Date(data$Date, "%d/%m/%Y"), data$Time)
data$Datetime <- as.POSIXct(datetime, tz = "PST")

startDay = as.POSIXct(
	strftime("2007-02-01 00:00:00 PST")
)
endDay = as.POSIXct(
	strftime("2007-02-03 00:00:00 PST")
)
#startDay = "1/2/2007"
#endDay = "2/2/2007"

plot(
	data$Datetime,
	data$Global_active_power,
	xlim=c(
		startDay,
		endDay
	),
	xaxt="n",
	type="l",
	xlab="",
	ylab="Global Active Power (kilowatts)"
)
axis.POSIXct(
	1,
	at=seq(
		startDay,
		endDay,
		by="day"
	),
	format="%a"
)

dev.off()

