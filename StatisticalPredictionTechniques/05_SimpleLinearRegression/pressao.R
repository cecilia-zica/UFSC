# Leitura e vizualizacao dos dados
dados = read.csv2("pressao.csv")
plot(dados, lwd=6)
cor(dados)

# Coeficientes do modelo
modelo = lm(pressao ~ idade, data=dados)
coef(modelo)

# Reta de regressao no modelo
abline(modelo)
novo = data.frame("idade"=48)
predict(modelo,novo)
