#como saber se o modelo é regressivo ou nao?
# LEITURA DA BASE
base = read.csv2("exercicio.csv")

plot(base$potencia,base$consumo)

# Modelo1 linear
modelo1 = lm(consumo ~ potencia, data=base)
summary(modelo1)

# Qualidade do Ajuste
plot(fitted(modelo1),rstandard(modelo1))
abline(0,0)

# Modelo 2 - Funcao Potencia
modelo2 = lm(log(consumo) ~ log(potencia), data=base)
summary(modelo2)

# Qualidade do Ajuste 2
plot(fitted(modelo2),rstandard(modelo2))
abline(0,0)

# Modelo 3 - Funcao Exponencial
modelo3 = lm(log(consumo) ~ potencia, data=base)
summary(modelo3)

# Qualidade do Ajuste 3
plot(fitted(modelo3),rstandard(modelo3))
abline(0,0)

# Modelo 4 - Funcao Logaritmica
modelo4 = lm(consumo ~ log(potencia), data=base)
summary(modelo4)

# Qualidade do Ajuste 4
plot(fitted(modelo4),rstandard(modelo4))
abline(0,0)

# Previsão usando o Modelo 2
novo = data.frame(potencia=160)
summary(modelo2)
exp(predict(modelo2,novo))

# Analise grafica faz o exponencial a volta, ele volta e deixa a relacao nao linear
#mas usou um modelo linear para o ajuste
base$predito = exp(predict(modelo2,base))
base_ordenada <- base[order(base$potencia), ]
plot(base$potencia,base$consumo)
lines(base_ordenada$potencia,base_ordenada$predito,
      col = "red", lwd = 2)

