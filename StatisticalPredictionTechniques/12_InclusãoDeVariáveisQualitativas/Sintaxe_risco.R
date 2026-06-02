# Leitura da base de dados
base = read.csv2("risco.csv")
names(base)

# Classificacao das variaveis qualitativas
base$Tabag = as.factor(base$Tabag)

# Modelo de Regressao Multipla
modelo <- lm(Risco ~ Idade + PA + Tabag, data=base)
summary(modelo)

library(car)
Anova(modelo)
