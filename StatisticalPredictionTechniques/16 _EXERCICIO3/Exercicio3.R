#-------------------------------------------------------------
# Carregar pacotes
library(ggplot2)
library(dplyr)
library(car)

# Carregar dados
base <- read.csv2("carros.csv")

#------------------------------------------------------------
# a) Aamostra de 800 carros
#-------------------------------------------------------------
set.seed(11122004)
base1 <- base[sample(nrow(base), 800), ]

#-------------------------------------------------------------
# b) Criar variável de idade - a paritr do ano do carro
#-------------------------------------------------------------
base1 <- base1 |>
  mutate(idade = ifelse(!is.na(ano), as.numeric(format(Sys.Date(), "%Y")) - ano, NA))

#Fator estado_conservacao
base1$estado_conservacao <- as.factor(base1$estado_conservacao)

#-------------------------------------------------------------
# c) Ajuste de modelo com interacao
#-------------------------------------------------------------
# Modelo com interação entre idade e estado de conservação
modelo_interacao <- lm(preco ~ idade * estado_conservacao, data = base1)

# Resumo do modelo
summary(modelo_interacao)

# d) Análise de variância (para verificar significância dos termos)
Anova(modelo_interacao, type = 3)

#-------------------------------------------------------------
# Ajustando o modelo de acordo com a significância
#-------------------------------------------------------------
# Modelo sem interação
modelo_sem_interacao <- lm(preco ~ idade + estado_conservacao, data = base1)

# Resultados
summary(modelo_sem_interacao)
car::Anova(modelo_sem_interacao, type = 3)

# e) Interpretação

#-------------------------------------------------------------
# f) Gráfico de representação do modelo
#-------------------------------------------------------------
library(ggplot2)

ggplot(base1, aes(x = idade, y = preco, color = estado_conservacao)) +
  geom_point(alpha = 0.5) +  # pontos de dispersão
  geom_smooth(method = "lm", se = FALSE, linewidth = 1.2) +  # linhas de regressão
  labs(
    title = "Interação entre Idade e Estado de Conservação",
    subtitle = "Linhas quase paralelas indicam ausência de interação significativa",
    x = "Idade do carro (anos)",
    y = "Preço (R$)",
    color = "Estado de Conservação"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5),
    plot.subtitle = element_text(hjust = 0.5),
    legend.position = "bottom"
  )

#-------------------------------------------------------------
# g) Exemplo de Carro com idade=5 e estado_conservacao= Excelente
#-------------------------------------------------------------
# Criar um novo carro com essas características
novo_carro <- data.frame(
  idade = 5,
  estado_conservacao = "Excelente"
)

# Previsão com intervalo de confiança e intervalo de predição
ic <- predict(modelo_sem_interacao, newdata = novo_carro, interval = "confidence")
ip <- predict(modelo_sem_interacao, newdata = novo_carro, interval = "prediction")

ic
ip

