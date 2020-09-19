library(plyr)
library(readr)
pollutantmean <- function (directory, pollutant, id) {
  mean_vector <- vector()
  file_list <- vector(mode = "list", length = 0)
  count = 1
  for (i in id) {
    i <- formatC(i, width=3, flag="0")
    i <- paste(i, ".csv", sep = "")
    file_name <- paste(directory, i, sep = "")
    file_list[count] <- file_name
    count <- count + 1
  }
  print(file_list)
  df <- ldply(file_list, read_csv)
  if (pollutant=="sulfate") {
    mean_pollutant <- mean(df$sulfate, na.rm=TRUE)
  } else if (pollutant == "nitrate") {
      mean_pollutant <- mean(df$nitrate, na.rm=TRUE)
  } else {
      print("Invalid Pollutant")
  }
  return(mean_pollutant)
}
