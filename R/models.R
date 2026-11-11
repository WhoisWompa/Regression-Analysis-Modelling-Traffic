# Model fitting and formal tests.

library(lmtest)

# Candidate model formulas (kept in one place so every step uses the same ones).
FORMULA_FULL        <- aadt ~ x1 + x2 + x3 + x4
FORMULA_LOG_FULL    <- log(aadt) ~ x1 + x2 + x3 + x4
FORMULA_LOG_REDUCED <- log(aadt) ~ x1 + x2 + x4   # x3 (width) dropped

fit_model <- function(formula, data) lm(formula, data = data)

# Durbin-Watson test for sequential dependence.
run_dw_test <- function(formula, data) dwtest(formula, data = data)

# F-test of a reduced model against a full model (H0: dropped coefficients = 0).
compare_models <- function(reduced, full) anova(reduced, full)
