# Leitura da base
base = read.csv2("Lucro2.csv")
names(base)

# Gráfico de cada variável independente com a variável dependente
plot(base$Clientes,base$Lucro) #relacao nao linear
plot(base$Tempo,base$Lucro) #relacao nao linear e variabilidade aumentou

# Modelo
modelo1 = lm(Lucro ~ Clientes + Tempo, data=base)
summary(modelo1)

# Qualidade do Ajuste
plot(fitted(modelo1),rstandard(modelo1))
abline(0,0)

# Modelo 2
modelo2 = lm(log(Lucro) ~ Clientes + Tempo, data=base) #so usei porque vi funcao exponencial -> melhorou muito o log
summary(modelo2)

# Qualidade do Ajuste
plot(fitted(modelo2),rstandard(modelo2))
abline(0,0)

