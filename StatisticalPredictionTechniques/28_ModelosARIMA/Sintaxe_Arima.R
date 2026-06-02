# LEITURA DA BASE
library(forecast)
base = read.csv2("energia.csv")
energia = ts(base$consumo, frequency=12, start=c(1980,1))


# AJUSTE DO MODELO DE MÉDIAS MÓVEIS
dif1 = diff(energia)
ma_p1 <- arima(dif1, order = c(0, 0, 1))
coefficients(ma_p1) %>% round(4)
forecast::checkresiduals(ma_p1)


# PREVISÃO DO MODELO DE MÉDIAS MÓVEIS
library(forecast)
forecast(ma_p1, h = 10) |> autoplot()


# PREVISÃO MANUAL DO MODELO DE MÉDIAS MÓVEIS
theta1 <- coef(ma_p1)["ma1"]
mu <- coef(ma_p1)["intercept"]
resid_T <- tail(residuals(ma_p1), 1)
x_T1 <- mu + theta1 * resid_T


# AJUSTE DO MODELO ARIMA
mod.arima <- auto.arima(energia, seasonal = FALSE)
summary(mod.arima)
mod.arima %>% forecast(h = 36) %>% autoplot()

mod.sarima <- auto.arima(energia, seasonal = TRUE)
summary(mod.sarima)
mod.sarima %>% forecast(h = 36) %>% autoplot()


# AJUSTE DOS MODELOS SEPARANDO BASE TREINO E BASE TESTE
treino <- window(energia, end = c(2022, 12))
teste <- window(energia, start = c(2023, 1))

mod.arima2 <- auto.arima(treino, seasonal = FALSE) 
prev_arima <- forecast(mod.arima2, h = length(teste))
mod.sarima2 <- auto.arima(treino, seasonal = TRUE) 
prev_sarima <- forecast(mod.sarima2, h = length(teste))


# DIAGNÓSTICO DE RESÍDUOS
checkresiduals(mod.arima2)
checkresiduals(mod.sarima2)


# ANÁLISE GRÁFICA DO AJUSTE
library(ggplot2)
autoplot(prev_arima) +
  autolayer(prev_arima$mean, series = "Previsto", color = "blue") +
  autolayer(teste, series = "Real", linetype = "dashed", color = "black") +
  labs(title = "Previsão vs Valores Reais",x = "Ano",y = "Consumo") +
  theme_minimal()

autoplot(prev_sarima) +
  autolayer(prev_sarima$mean, series = "Previsto", color = "blue") +
  autolayer(teste, series = "Real", linetype = "dashed", color = "black") +
  labs(title = "Previsão vs Valores Reais",x = "Ano",y = "Consumo") +
  theme_minimal()


# ACURACIA DA PREVISAO (EAM)
teste = cbind(teste, prev_arima$mean, prev_sarima$mean)
colnames(teste) <- c("Real","Arima","Sarima")
teste = as.data.frame(teste)

eam <- function(yreal, yprev) {
  mean(abs(yreal-yprev))
}
eam(yreal = teste$Real, yprev = teste$Arima)
eam(yreal = teste$Real, yprev = teste$Sarima)
