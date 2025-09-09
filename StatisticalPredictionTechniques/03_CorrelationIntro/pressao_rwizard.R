# Ler o arquivo com separador ';' e decimal ','
dados <- read.csv2("pressao.csv", stringsAsFactors = FALSE)

# Converter colunas para numéricas (read.csv2 lê como texto por padrão)
dados$idade <- as.numeric(dados$idade)
dados$pressao <- as.numeric(dados$pressao)

# Visualizar as primeiras linhas
head(dados)

# Ler o arquivo com separador ';' e decimal ','
dados <- read.csv2("pressao.csv", stringsAsFactors = FALSE)

# Converter colunas para numéricas (read.csv2 lê como texto por padrão)
dados$idade <- as.numeric(dados$idade)
dados$pressao <- as.numeric(dados$pressao)

# Visualizar as primeiras linhas
head(dados)

#########################################################################
# - - - Grafico de dispersão

# Carregar o pacote ggplot2
library(ggplot2)

# Gráfico
ggplot(dados, aes(x = idade, y = pressao)) +
  geom_point(color = "#1f77b4", size = 3) +
  labs(
    title = "Gráfico de Dispersão: Idade vs Pressão Arterial",
    x = "Idade (anos)",
    y = "Pressão Arterial (mmHg)"
  ) +
  theme_minimal()
#########################################################################

# - - - Gráfico com Reta de regressão linear 
ggplot(dados, aes(x = idade, y = pressao)) +
  geom_point(color = "#1f77b4", size = 3) +
  geom_smooth(method = "lm", se = TRUE, color = "darkred") +
  labs(
    title = "Idade vs Pressão com Regressão Linear",
    x = "Idade (anos)",
    y = "Pressão Arterial (mmHg)"
  ) +
  theme_minimal()

###########################################################################
# - - - Outro gráfico com reta de regressão linear
ggplot(dados, aes(x = idade, y = pressao)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

# - - - Correlação Linear de Pearson
cor(dados$idade, dados$pressao, method = "pearson")
