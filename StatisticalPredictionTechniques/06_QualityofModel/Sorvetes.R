# Dados
dados = read.csv2("sorvetes.csv")

# Gráfico
plot(dados)

# Correlacao
cor(dados)

# Modelo de regressao linear
modelo = lm(Vendas ~ Temperatura, data=dados)
coef(modelo)

# Coeficiente de determinacao
summary(modelo)$r.squared

# Analise de Residuos
plot(fitted(modelo),rstandard(modelo))
abline(0,0)

# Analise de Residuos geral
# https://library.virginia.edu/data/articles/diagnostic-plots
par(mfrow=c(2,2))
plot(modelo)

