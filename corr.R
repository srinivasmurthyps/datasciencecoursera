library(tools)
source("C:\\Users\\srini\\Documents\\LearnRProgramming\\complete.R")
corr <- function(directory, threshold = 0) {
  files_list = list.files(directory)
  files_id <- vector(mode="list", length=0)
  corr_list <- vector(mode="list", length=0)
  count <- 1
  for (i in files_list) {
    file_num <- strsplit(i, ".csv")[[1]]
    file_num <- as.numeric(file_num)
    df <- complete(folder, file_num)
    if (df$nobs > threshold) {
      file_name <- paste(folder, i, sep = "")
      df_data <- read.csv(file_name)
      corr_list[count] <- cor(df_data$sulfate, df_data$nitrate, use = "complete")
      count <- count + 1
    } 
  }
  corr_df <- corr_list
  corr_df <- as.data.frame(corr_df)
  return(corr_df)
}
