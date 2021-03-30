#
countNA <- function(rwl, icol) {
  rwl_df <- setRWL2DF(rwl)
  s0 <- rwl.df[, c(1, icol)]
  ss <- na.omit(s0)
  ss_min <- min(ss$Year)
  ss_max <- max(ss$Year)
  ss_unique <- unique(ss$Year)
  ss_seq <- ss_min:ss_max
  ss_abs <- abs(length(ss_seq) - length(ss_unique))
  ss_abs
}
