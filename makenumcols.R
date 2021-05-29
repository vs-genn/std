# https://stackoverflow.com/posts/44570217/revisions
makenumcols <- function(df) {
  df <- as.data.frame(df)
  df[] <- lapply(df, as.character)
  cond <- apply(df, 2, function(x) {
    x <- x[!is.na(x)]
    all(suppressWarnings(!is.na(as.numeric(x))))
  })
  numeric_cols <- names(df)[cond]
  df[,numeric_cols] <- sapply(df[,numeric_cols], as.numeric)
  return(df)
}
#df <- makenumcols(df)
