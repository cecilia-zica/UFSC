# Leitura da base de dados
base = read.csv2("salarios.csv")
names(base)

# Modelo de Regressao Multipla
modelo = lm(Salario ~ Experiencia + Gerencia + Educacional, data=base)
summary(modelo)

# Teste de Hipotese das variaveis
library(car)
Anova(modelo)

# Diferenca entre dois coeficientes
library(multcomp)
K <- matrix(c(0, 0, 0, -1, 1), 1)
t <- glht(modelo, linfct = K)
summary(t)
