complete <- function (directory, id) {
  output_df <- data.frame("id" = numeric(0), "nobs"=numeric(0))
  count <- 1
  for (i in id) {
    i_modified <- formatC(i, width=3, flag="0")
    i_modified <- paste(i_modified, ".csv", sep = "")
    file_name <- paste(directory, i_modified, sep = "")
    df <- read.csv(file_name)
    df <- df[complete.cases(df), ]
    total_records <- NROW(df)
    output_df[count, ] <- c(i, total_records)
    count <- count + 1
  }
  return(output_df)
}



