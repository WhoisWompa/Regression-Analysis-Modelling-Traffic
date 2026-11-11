# MH3510 Group Assignment: modelling AADT with multiple regression.
# Run from the project folder:  Rscript main.R

for (f in list.files("R", pattern = "[.]R$", full.names = TRUE)) source(f)

# ---- 1. Data and graphical display ----
section("1. Data"); aadt_data <- load_aadt()
save_figure("01_scatter_matrix", function() plot_scatter_matrix(aadt_data))

# ---- 2. Initial model ----
section("2. Initial model")
mlr <- fit_model(FORMULA_FULL, aadt_data); show(summary(mlr))

# ---- 3. Adequacy checking (original model) ----
section("3. Adequacy: original model")
save_figure("02_qq_original", function() plot_qq(mlr, "Normal Q-Q (original model)"))
save_figure("03_resid_original", function() plot_residual_panel(mlr, aadt_data), 1200, 800)
show(run_dw_test(FORMULA_FULL, aadt_data))

# ---- 3b. Log transformation ----
section("3b. Log model")
mlr_log <- fit_model(FORMULA_LOG_FULL, aadt_data); show(summary(mlr_log))
save_figure("04_qq_log", function() plot_qq(mlr_log, "Normal Q-Q (log model)"))
save_figure("05_resid_log", function() plot_residual_panel(mlr_log, aadt_data), 1200, 800)
show(run_dw_test(FORMULA_LOG_FULL, aadt_data))

# ---- 4. Simplify: drop x3 ----
section("4. Reduced log model and F-test")
mlr_log2 <- fit_model(FORMULA_LOG_REDUCED, aadt_data); show(summary(mlr_log2))
show(compare_models(mlr_log2, mlr_log))
save_figure("06_reduced_check", function() plot_reduced_check(mlr_log2))

# ---- 5. Prediction ----
section("5. Prediction")
res <- predict_all(mlr_log2, NEW_SECTION)
show(res$log_confidence); show(res$log_prediction)
show(res$confidence);     show(res$prediction)
