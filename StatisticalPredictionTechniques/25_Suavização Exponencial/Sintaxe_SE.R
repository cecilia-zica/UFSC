library(tidyverse)
library(forecast)
library(lubridate)

# LEITURA E PREPARACAO DA BASE DE DADOS
base = read.csv2("energia.csv")
indice_teste <- tail(1:nrow(base), 12)
treino = base[-indice_teste,]
teste = base[indice_teste,]
base_ts = ts(treino$consumo, frequency=12, start=c(1980,1))


# VISUALIZACAO GRAFICA
autoplot(base_ts)

df_republica = tribble(
  ~presidente, ~inicio,
  "José Sarney", dmy(15031985),
  "Fernando Collor", dmy(15031990),
  "Itamar Franco", dmy(29121992),
  "FHC", dmy(01011995),
  "Lula", dmy(01012003),
  "Dilma Rousseff", dmy(01012011),
  "Michel Temer", dmy(31082016),
  "Jair Bolsonaro", dmy(01012018),
  "Lula", dmy(01012022)
)
treino$date=ymd(treino$date)
ggplot(treino, aes(x = date, y = consumo)) +
  geom_line() +
  theme_minimal() +
  geom_vline(data = df_republica, aes(xintercept = inicio), linetype = "dashed") +
  labs(x = NULL, y = "kWh",
       title = "Consumo de energia elétrica na indústria brasileira")


# AJUSTE DO MODELO DE SUAVIZACAO EXPONENCIAL SIMPLES
SES1 = ses(base_ts, alpha = 0.1)
SES2 = ses(base_ts, alpha = 0.9)
SES = ses(base_ts, h=12)

plot(base_ts,type="s")
lines(fitted(SES1), col="blue")
lines(fitted(SES2), col="red")
lines(fitted(SES), col="green")
legend("topleft",lty=1, col=c(1,"blue","red","green"),
       c("serie original", expression(alpha == 0.1),
         expression(alpha == 0.9),
         expression(alpha == "Auto")),
       pch=1)


# AJUSTE DO MODELO DE SUAVIZACAO EXPONENCIAL DE HOLT
HOLT1 = holt(base_ts, alpha = 0.6, beta = 0.4)
HOLT = holt(base_ts, h=12)

plot(base_ts,type="s")
lines(fitted(HOLT1), col = "blue")
lines(fitted(HOLT), col = "red")


# AJUSTE DO MODELO DE SUAVIZACAO EXPONENCIAL DE HOLT-WINTER
HW_ad = hw(base_ts, seasonal = "additive")
HW_mult = hw(base_ts, seasonal = "multiplicative")

plot(base_ts,type="s")
lines(fitted(HW_ad), col = "blue")
lines(fitted(HW_mult), col = "red")


# AJUSTE DO MODEO AUTOMATICO
modelo_ets = ets(base_ts)

plot(base_ts,type="s")
lines(fitted(modelo_ets), col = "blue")


# GRAFICO DA PREVISAO
SES.predito = forecast(SES,h=12)
HOLT.predito = forecast(HOLT,h=12)
HWad.predito = forecast(HW_ad,h=12)
HWmult.predito = forecast(HW_mult,h=12)
ETS.predito = forecast(modelo_ets,h=12)

teste = cbind(teste,SES.predito$mean,HOLT.predito$mean,
              HWad.predito$mean,HWmult.predito$mean,
              ETS.predito$mean)
colnames(teste) = c("date","consumo","SES","HOLT","HW.ad","HW.mult","ETS")

teste$date <- as.Date(teste$date)
library(ggplot2)
ggplot(teste, aes(x = date)) +
  geom_line(aes(y = consumo, color = "Consumo"), linetype = "solid") +
  geom_line(aes(y = SES, color = "SES"), linetype = "dashed") +
  geom_line(aes(y = HOLT, color = "HOLT"), linetype = "solid") +
  geom_line(aes(y = HW.ad, color = "HW.ad"), linetype = "dashed") +
  geom_line(aes(y = HW.mult, color = "HW.mult"), linetype = "solid") +
  geom_line(aes(y = ETS, color = "ETS"), linetype = "solid") +
  scale_color_manual(name = "Modelos",
    values = c("Consumo" = "black", "SES" = "blue", "HOLT" = "blue",
      "HW.ad" = "green", "HW.mult" = "green", "ETS" = "red")) +
  theme_bw() +
  labs(x = "Data", y = "Consumo", color = "Modelo") +
  theme(legend.position = "bottom")


# ACURACIA DA PREVISAO (EAM)
eam <- function(yreal, yprev) {
  mean(abs(yreal-yprev))
}
eam(yreal = teste$consumo, yprev = teste$SES)
eam(yreal = teste$consumo, yprev = teste$HOLT)
eam(yreal = teste$consumo, yprev = teste$HW.ad)
eam(yreal = teste$consumo, yprev = teste$HW.mult)
eam(yreal = teste$consumo, yprev = teste$ETS)
