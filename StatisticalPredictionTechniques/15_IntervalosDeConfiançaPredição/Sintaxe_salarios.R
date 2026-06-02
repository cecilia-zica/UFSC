# CARREGAR DADOS
base = read.csv2("salarios.csv")

# Classificacao das variaveis qualitativas
base$Gerencia = as.factor(base$Gerencia)
base$Educacional = as.factor(base$Educacional)


#############################################################################
# Intervalo de confianca para o Salario

t.test(base$Salario, conf.level=0.95)

#############################################################################
# Modelo: Salario = Experiencia

modelo = lm(Salario ~ Experiencia, data=base)
summary(modelo)

# Intervalo de confiança e de predição para os dados da base
IC1 = predict(modelo, interval="confidence",level = 0.95)
IC2 = predict(modelo, interval="predict",level = 0.95)
new = data.frame(base,IC1,IC2)

# Gráfico
library("ggplot2")
ggplot(new, aes(Experiencia, Salario)) +
  geom_point() +
  geom_line(aes(y = fit), color = "blue") +
  geom_line(aes(y = lwr), color = "black") +
  geom_line(aes(y = upr), color = "black") +
  geom_line(aes(y = lwr.1), color = "red", linetype = "dashed") +
  geom_line(aes(y = upr.1), color = "red", linetype = "dashed")


#############################################################################
# Modelo: Salario = Experiencia + Gerencia

modelo = lm(Salario ~ Experiencia + Gerencia, data=base)
summary(modelo)

# Intervalo de confiança e de predição para os dados da base
IC1 = predict(modelo, interval="confidence",level = 0.95)
IC2 = predict(modelo, interval="predict",level = 0.95)
new = data.frame(base,IC1,IC2)
new0 = new[new$Gerencia=='NAO',]
new1 = new[new$Gerencia=='SIM',]

# Gráfico sem Gerencia
library(ggplot2)
ggplot(new0, aes(Experiencia, Salario)) +
  geom_point() +
  geom_line(aes(y = fit), color = "blue") +
  geom_line(aes(y = lwr), color = "black") +
  geom_line(aes(y = upr), color = "black") +
  geom_line(aes(y = lwr.1), color = "red", linetype = "dashed") +
  geom_line(aes(y = upr.1), color = "red", linetype = "dashed")


# Gráfico com Gerencia
library(ggplot2)
ggplot(new1, aes(Experiencia, Salario)) +
  geom_point() +
  geom_line(aes(y = fit), color = "blue") +
  geom_line(aes(y = lwr), color = "black") +
  geom_line(aes(y = upr), color = "black") +
  geom_line(aes(y = lwr.1), color = "red", linetype = "dashed") +
  geom_line(aes(y = upr.1), color = "red", linetype = "dashed")


#############################################################################
# Modelo: Salario = Experiencia + Gerencia + Educacional

# Modelo
modelo = lm(Salario ~ Experiencia + Gerencia + Educacional, data=base)
summary(modelo)
pred1 = data.frame(Experiencia=0,Gerencia='SIM',Educacional='SUP')
pred2 = data.frame(Experiencia=0,Gerencia='NAO',Educacional='SUP')
novo = rbind(pred1,pred2)

# Previsão de um novo valor
predito = predict(modelo, novo, interval="predict",level=0.95)



