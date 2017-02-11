source('load_data.R')

data <- loadData()

png(
	filename='plot3.png',
	width=480,
	height=480,
	units='px'
)

startDay = as.POSIXct(
	strftime("2007-02-01 00:00:00")
)
endDay = as.POSIXct(
	strftime("2007-02-03 00:00:00")
)

datetime <- paste(as.Date(data$Date, "%d/%m/%Y"), data$Time)
data$Datetime <- as.POSIXct(datetime, tz = "PST")

plot(
	data$Datetime,
	data$Sub_metering_1,
	xlim=c(
		startDay,
		endDay
	),
	xaxt="n",
	type="l",
	xlab="",
	ylab="Energy sub metering"
)

lines(
	data$Datetime,
	data$Sub_metering_2,
	col="red"
)

lines(
	data$Datetime,
	data$Sub_metering_3,
	col="blue"
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

legend(
	"topright", 
	legend=c(
		'Sub_metering_1',
		'Sub_metering_2',
		'Sub_metering_3'
	),
	col=c(
		'black',
		'red',
		'blue'
	),
	lty=c(1, 1, 1)
)

dev.off()

