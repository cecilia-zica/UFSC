# Dados
dados = read.csv2('clientes.csv')

# Grafico
plot(dados)

# Intervalo de Confianca
cor.test(dados$anos, dados$clientes, conf.level=0.95)$conf.int

# Teste de Hipoteses
cor.test(dados$anos, dados$clientes, alternative='two.sided')
