# CARREGAR DADOS
base = read.csv2("salarios.csv")

# Gráfico do efeito da variável quantitativa
library(ggplot2)
ggplot(data = base, aes(x = Experiencia, y = Salario)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Gráfico do efeito da Experiência",
       x = "Experiência",
       y = "Salário")

# Grafico da interacao
ggplot(data = base, aes(x = Experiencia, y = Salario, color = Gerencia)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Gráfico da Interação",
       x = "Experiência",
       y = "Salário")

# Modelo
modelo1 = lm(Salario ~ Experiencia*Gerencia, data=base)
summary(modelo1)
library(car)
Anova(modelo1, type=3)

