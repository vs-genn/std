# https://github.com/PecanProject/pecan/blob/eb55663d4362562e60ed42bbae93969e1ad4ee04/modules/data.land/R/Read_Tuscon.R
clean_tucson <- function(file) {
  lines <- scan(file, character(), sep = "\n")
  split <- strsplit(lines, " ")
  tags <- NULL
  decade <- NULL
  
  for (i in seq_along(split)) {
    tags[i]   <- split[[i]][1]
    decade[i] <- split[[i]][2]
  }
  utags <- unique(tags)
  newfile <- paste0(file, ".COR.txt")
  if (file.exists(newfile)) {
    file.remove(newfile)
  }
  
  for (tag in utags) {
    rows <- rev(which(tags == tag))
    keep <- 1
    for (i in seq_along(rows)) {
      if (rows[i] - rows[keep] >= -1) {
        keep <- i
      } else {
        break
      }
    }
    keep   <- min(keep, length(rows))
    rows   <- rev(rows[1:keep])
    append <- file.exists(newfile)
    write(lines[rows], newfile, append = append)
  }
  return(newfile)
} 
