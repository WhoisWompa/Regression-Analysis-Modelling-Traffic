# Prediction on the log scale and back-transformed to vehicles per day.

predict_interval <- function(model, newdata, type, level = CONF_LEVEL) {
  predict(model, newdata, interval = type, level = level)
}

# Returns both interval types, on log scale and original scale.
predict_all <- function(model, newdata, level = CONF_LEVEL) {
  conf <- predict_interval(model, newdata, "confidence", level)
  pred <- predict_interval(model, newdata, "prediction", level)
  list(log_confidence = conf, log_prediction = pred,
       confidence = exp(conf), prediction = exp(pred))
}
