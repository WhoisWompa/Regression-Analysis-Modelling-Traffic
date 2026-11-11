# Central settings for the AADT analysis.

DATA_PATH   <- file.path("data", "aadt.txt")
FIGURE_DIR  <- "figures"
SAVE_FIGURES <- TRUE   # FALSE = draw on screen instead of writing PNGs

CONF_LEVEL  <- 0.95

# New road section to predict (x4 uses the recoded 0/1 dummy; 0 = no access control).
# Original coding was x4 = 2 (no access control).
NEW_SECTION <- data.frame(x1 = 50000, x2 = 3, x3 = 60, x4 = 0)
