#Leitura dos dados
dados = read.csv2('pressao.csv')
#Grafico
plot(dados)
# Coeficiente de correlacao
cor(dados)

# - - - Interpretação - - - 
#O gráfico mostra que a pressão arterial (variável dependente Y) tende a aumentar com a idade (variável independente X).
#O coeficiente de correlação de Pearson é r = 0.896, indicando uma forte correlação positiva linear entre idade e pressão.
#Isso significa que cerca de 80,3% da variação na pressão arterial pode ser explicada linearmente pela idade.
#Os outros 19,7% da variação podem ser atribuídos a fatores não incluídos no modelo, como alimentação, estresse, genética, atividade física, etc.

#################################################################################
# Leitura dos dados
dados_reta <- read.csv2("pressao.csv")

# Gráfico de dispersão com linha de regressão
plot(dados_reta)
abline(lm(pressao ~ idade, data = dados_reta), col = "red", lwd = 2)

# Coeficiente de correlação
cor(dados_reta)
