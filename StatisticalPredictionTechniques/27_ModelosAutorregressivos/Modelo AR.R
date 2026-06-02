library(forecast)
base = read.csv2("energia.csv")
energia = ts(base$consumo, frequency=12, start=c(1980,1))
autoplot(energia)

# Decomposicao da serie temporal
autoplot(mstl(energia))

# Autocorrelacao
lag.plot(energia, lags = 9)
acf(energia)

# Diferenciacao da serie nao estacionaria
head(energia,10)
head(diff(energia), 10)
head(diff(energia, 2), 10)

dif1 = diff(energia)
autoplot(dif1)
lag.plot(dif1, lags = 9)
acf(dif1)

dif2 = diff(energia, 2)
autoplot(dif2)
lag.plot(dif2, lags = 9)
acf(dif2)

d = ndiffs(energia)

# Testando a estacionaridade
library(tseries)
adf.test(energia)
adf.test(dif1)

# Ajustando o modelo Autorregressivo
ar.p1 <- arima(dif1, order = c(1, 0, 0))
coefficients(ar.p1)
ar.p2 <- arima(dif2, order = c(1, 0, 0))
coefficients(ar.p2)

# Diagnóstico do modelo
forecast::checkresiduals(ar.p1)
forecast::checkresiduals(ar.p2)

# Acuracia do modelo
forecast::accuracy(ar.p1)
forecast::accuracy(ar.p2)

# Previsao do modelo
forecast <- predict(ar.p1, n.ahead = 12)
forecast$pred
library(forecast)
forecast(ar.p1, h = 12) |> autoplot()


# PREVISAO PARA OS DADOS REAIS
c = ar.p1$coef[2]
phi_1 = ar.p1$coef[1]
yt = 17253
drift = 479
yh = yt + (c + phi_1*drift) 
