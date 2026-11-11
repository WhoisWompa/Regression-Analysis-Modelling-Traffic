# Data loading and preparation.

# Read aadt.txt and return a tidy data frame.
# Columns: aadt (response), x1 county population, x2 lanes, x3 width (ft),
# x4 access control dummy (1 = access control, 0 = none).
load_aadt <- function(path = DATA_PATH) {
  raw <- read.table(path, header = FALSE)  # only the first 5 columns are used
  recode_aadt(raw)
}

# In the file x4 is 1 = access control, 2 = no access control; recode to 0/1.
recode_aadt <- function(raw) {
  data.frame(
    aadt = raw$V1,
    x1   = raw$V2,
    x2   = raw$V3,
    x3   = raw$V4,
    x4   = ifelse(raw$V5 == 1, 1, 0)
  )
}
