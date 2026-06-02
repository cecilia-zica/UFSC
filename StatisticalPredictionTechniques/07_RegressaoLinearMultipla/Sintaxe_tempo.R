# Leitura da Base
Base = read.csv2("tempo.csv")

# Modelo de Regressão Múltipla
modelo = lm(y ~ x1 + x2, data=Base)
summary(modelo)

# Importância Relativa de cada variável
library(car)
avPlots(modelo)

# Predição
novo = data.frame(x1=c(15,15),x2=c(20,21))
pred = predict(modelo,novo)
pred
round(pred[2]-pred[1],4)
