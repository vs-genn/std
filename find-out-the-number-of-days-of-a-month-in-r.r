daysInMonth <- function(d = Sys.Date()){

  m = substr((as.character(d)), 6, 7)              # month number as string
  y = as.numeric(substr((as.character(d)), 1, 4))  # year number as numeric
# https://stackoverflow.com/questions/6243088/find-out-the-number-of-days-of-a-month-in-r
days.in.month = function(month, year = NULL){

  month = as.integer(month)

  if (is.null(year))
    year = as.numeric(format(Sys.Date(), '%Y'))

  dt = as.Date(paste(year, month, '01', sep = '-'))
  dates = seq(dt, by = 'month', length = 2)
  as.numeric(difftime(dates[2], dates[1], units = 'days'))
}
  
  # Quick check for leap year
  leap = 0
  if ((y %% 4 == 0 & y %% 100 != 0) | y %% 400 == 0)
    leap = 1

  # Return the number of days in the month
  return(switch(m,
                '01' = 31,
                '02' = 28 + leap,  # adds 1 if leap year
                '03' = 31,
                '04' = 30,
                '05' = 31,
                '06' = 30,
                '07' = 31,
                '08' = 31,
                '09' = 30,
                '10' = 31,
                '11' = 30,
                '12' = 31))
}

numberOfDays <- function(d){
    temp <- unlist(strsplit(as.character(d),"-"))
    begin <- as.Date(paste(temp[1],temp[2],"01",sep="-"))
    if (temp[2] != "12"){
        nextMonth <- as.character(as.integer(temp[2])+1)
        end <- as.Date(paste(temp[1],nextMonth,"01",sep="-"))
        return(as.integer(as.Date(end) - as.Date(begin)))
    } 
    else{
        nextYear <- as.character(as.integer(temp[1])+1)
        end <- as.Date(paste(nextYear,"01","01",sep="-"))
        return(as.integer(as.Date(end) - as.Date(begin)))
    }
}
