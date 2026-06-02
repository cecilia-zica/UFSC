# Leitura da base
base = read.csv2("Lucro1.csv")
names(base)

# Gráfico
plot(base$Tempo,base$Lucro)

# Modelo 1
modelo1 = lm(Lucro ~ Tempo, data=base)
summary(modelo1)

# Qualidade do Ajuste
plot(fitted(modelo1),rstandard(modelo1))
abline(0,0)

# Modelo 2
modelo2 = lm(log(Lucro) ~ Tempo, data=base)
summary(modelo2)

# Qualidade do Ajuste
plot(fitted(modelo2),rstandard(modelo2))
abline(0,0)

# Previsoes
previsao = predict(modelo2)
base1 = cbind(base,previsao)
base1$PrevLucro = exp(base1$previsao)

novo=data.frame(Tempo=3)
predict(modelo1,novo)
exp(predict(modelo2,novo))

