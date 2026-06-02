# Leitura da base
base = read.csv2("sorvetes.csv")

# Gráfico dos dados
plot(base$Temperatura,base$Vendas)

# Modelo 1
modelo1 = lm(Vendas ~ Temperatura, data=base) #precisa ver o resíduo e o R ao quadrado
summary(modelo1)

# Qualidade do Ajuste
plot(fitted(modelo1),rstandard(modelo1))
abline(0,0)

# Modelo 2
modelo2 = lm(Vendas ~ Temperatura + I(Temperatura^2), data=base) #termo quadrático
summary(modelo2)

# Qualidade do Ajuste
plot(fitted(modelo2),rstandard(modelo2))
abline(0,0)

# Modelo 3
modelo3 = lm(log(Vendas) ~ Temperatura, data=base) #linearmodel
summary(modelo3)

# Qualidade do Ajuste
plot(fitted(modelo3),rstandard(modelo3))
abline(0,0)

#Modelo 1: y = b0 + b1.x
#Modelo 2: y = b0 + b1.x + b2.x^2
#Modelo 3: lny = ln(b0) + b1.x

# Previsão
novo = data.frame(Temperatura=36) #qual a venda de sorvete com temperatura à 36 graus?
predict(modelo1,novo) #2734 sorvetes a venda
predict(modelo2,novo) #3000 sorvetes a venda
exp(predict(modelo3,novo)) # previsao do ln da venda - volta é fazendo exponencial e^ln(y) = y



