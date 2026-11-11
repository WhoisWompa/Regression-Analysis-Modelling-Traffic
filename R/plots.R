# Plotting helpers. Each draws one figure; save_figure() handles output.

# Run plot_fn and write it to figures/<name>.png (or draw on screen).
save_figure <- function(name, plot_fn, width = 900, height = 600) {
  if (SAVE_FIGURES) {
    dir.create(FIGURE_DIR, showWarnings = FALSE)
    png(file.path(FIGURE_DIR, paste0(name, ".png")), width = width, height = height)
    on.exit(dev.off())
  }
  plot_fn()
}

# Residuals vs a given x with a zero reference line.
residual_plot <- function(x, model, xlab, main = "") {
  plot(x, residuals(model), xlab = xlab, ylab = "Residuals", main = main)
  abline(h = 0, lty = 2)
}

plot_scatter_matrix <- function(data) plot(data)

plot_qq <- function(model, main) {
  qqnorm(residuals(model), main = main, ylab = "Residuals")
  qqline(residuals(model))
}

# 2x3 grid: order, fitted values, and each predictor.
plot_residual_panel <- function(model, data) {
  op <- par(mfrow = c(2, 3)); on.exit(par(op))
  residual_plot(seq_along(residuals(model)), model, "Observation order")
  residual_plot(fitted(model), model, "Fitted values")
  for (v in c("x1", "x2", "x3", "x4")) {
    residual_plot(data[[v]], model, toupper(v))
  }
}

# Compact check for the reduced model: Q-Q plot beside residuals vs fitted.
plot_reduced_check <- function(model) {
  op <- par(mfrow = c(1, 2)); on.exit(par(op))
  plot_qq(model, "Normal Q-Q (reduced log model)")
  residual_plot(fitted(model), model, "Fitted values",
                main = "Residuals vs fitted (reduced log model)")
}
