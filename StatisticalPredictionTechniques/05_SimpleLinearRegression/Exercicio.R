# Leitura e vizualizacao dos dados
dados = read.csv2("Exercicio.csv")
plot(dados, lwd=2)
cor(dados)

# Coeficientes do modelo
modelo = lm(Perda_Peso ~ Cal_Ing, data=dados)
summary(modelo)

modelo = lm(Perda_Peso ~ Ex_Aerob, data=dados)
summary(modelo)

# Reta de regressao no modelo
plot(dados$Ex_Aerob,dados$Perda_Peso)
abline(modelo)
novo = data.frame("Ex_Aerob"=150)
predict(modelo,novo)
