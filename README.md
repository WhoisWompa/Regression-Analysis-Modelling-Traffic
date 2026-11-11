# MH3510: Modelling AADT (multiple regression)

Run: `Rscript main.R` (needs the `lmtest` package; plots go to `figures/`).

| File | Purpose |
|---|---|
| `main.R` | Runs the analysis end to end |
| `R/config.R` | Paths, confidence level, new road section to predict |
| `R/data.R` | Load and recode `aadt.txt` |
| `R/models.R` | Model formulas, fitting, Durbin-Watson, F-test |
| `R/plots.R` | Q-Q, residual panels, scatter matrix, figure saving |
| `R/prediction.R` | Confidence/prediction intervals, back-transform |
| `R/report.R` | Console print helpers |
| `data/` | `aadt.txt` (and `Steam(2).dat`, unused here) |
