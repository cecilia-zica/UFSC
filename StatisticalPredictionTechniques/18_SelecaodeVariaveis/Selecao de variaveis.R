# LEITURA DA BASE
base = read.csv2("apart.csv")

# CLASSIFICACAO DA VARIAVEL QUALITATIVA
library(dplyr)
base$Local = case_match(base$Local, 1 ~ "Mais_Val", 2 ~ "Menos_Val")
base$Local = as.factor(base$Local)

# Forward stepwise regression
m0=lm(Valor ~ 1, data=base)
forward_model=step(m0, direction = "forward", 
                   scope = formula(lm(Valor ~ ., data=base)))

# Backward stepwise regression
mc=lm(Valor ~ ., data=base)
backward_model=step(mc, direction = "backward")

# Both-direction stepwise regression
mc=lm(Valor ~ ., data=base)
both_model=step(mc, direction = "both")

# QUALIDADE DO AJUSTE DO MODELO
summary(both_model)
plot(fitted(both_model),rstandard(both_model), 
     main = "Gráfico de Resíduos", 
     xlab = "Valores Ajustados", 
     ylab = "Resíduo Padronizado")
abline(0,0)

# Contribuicao de cada variavel
library(relaimpo)
imp<-calc.relimp(both_model)
var.exp<-data.frame(round(imp$lmg*100,1))
colnames(var.exp)<-"imp.lmg"
nome<-rownames(var.exp)
var.exp<-data.frame(nome,var.exp)
library(ggplot2)
ggplot(var.exp, aes(nome,imp.lmg)) +
  geom_bar(stat = "identity")+
  geom_text(aes(label = imp.lmg), vjust = 1.2, colour = "white")

