# Dados
dados = read.csv2("Exemplo1.csv")

# Modelo de regressao linear
modelo = lm(octanagem ~ aditivo, data=dados)
coef(modelo)

# Coeficiente de determinacao
summary(modelo)$r.squared

# Reta de regressao no modelo
plot(dados, lwd=4)
abline(modelo)
