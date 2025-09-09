# Leitura e vizualizacao dos dados
dados = read.csv2("salario.csv")
plot(dados, lwd=6)
cor(dados)

# Coeficientes do modelo
modelo = lm(Salario ~ Experiencia, data=dados)
coef(modelo)

# Reta de regressao no modelo
abline(modelo)
novo = data.frame("Experiencia"=3)
predict(modelo,novo)
