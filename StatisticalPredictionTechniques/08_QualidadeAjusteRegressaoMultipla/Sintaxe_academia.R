# Leitura da Base
Base = read.csv2("academia.csv")
names(Base)

# Modelo de Regressao Multipla
modelo = lm(Perda_Peso ~ Ex_Aerob + Cal_Ing, data=Base)
summary(modelo)

# Analise Grafica da relacao das variaveis independentes com a variavel dependente
library(car)
avPlots(modelo)

# Importancia de cada variavel no modelo
library(relaimpo)
imp = calc.relimp(modelo)
var.exp = data.frame(round(imp$lmg*100,1))
colnames(var.exp) = "imp.lmg"
nome = rownames(var.exp)
var.exp = data.frame(nome,var.exp)
library(ggplot2)
ggplot(var.exp,aes(nome,imp.lmg)) +
  geom_bar(stat = "identity")+
  geom_text(aes(label = imp.lmg), vjust = 1.5, colour = "white")

# Analise de residuos
plot(fitted(modelo), rstandard(modelo))
abline(0,0)

# Analise da distribuicao normal dos residuos
library(car)
qqPlot(modelo)

# Analise complementar
# https://library.virginia.edu/data/articles/diagnostic-plots
par(mfrow = c(2,2))
plot(modelo)
