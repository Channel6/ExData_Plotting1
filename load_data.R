library(dplyr)

loadData <- function(){
	file_handle = file("household_power_consumption.txt")
	table <- read.table(
		text = grep("^[1,2,3]{1}/2/2007", readLines(file_handle), value = TRUE),
		col.names = c(
			"Date",
			"Time",
			"Global_active_power",
			"Global_reactive_power",
			"Voltage",
			"Global_intensity",
			"Sub_metering_1",
			"Sub_metering_2",
			"Sub_metering_3"
		),
		sep = ";",
		na.strings = "?",
		header = TRUE
	)
	close(file_handle)
	return(table)
}
