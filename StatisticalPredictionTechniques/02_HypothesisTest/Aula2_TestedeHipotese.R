# Carrega os dados do tempo de reação do novo medicamento
base <- read.csv2("Exercicio.csv")

# Aplica o teste t para verificar se o tempo médio é menor que 15 minutos
teste <- t.test(base$Tempo, alternative = "less", mu = 15)

# Mostra o resultado completo do teste t
print(teste)

# Exibe o intervalo de confiança de 95%
ic <- t.test(base$Tempo, conf.level = 0.95)$conf.int
print(ic)

# --- INTERPRETAÇÃO ---
# Estatística t = -0.749, com 29 graus de liberdade
# p-valor = 0.2299 → maior que 0.05 → NÃO rejeita H0
# Conclusão: ao nível de 5% de significância, não há evidência suficiente
# para afirmar que o novo medicamento reduz o tempo médio de reação.

# Intervalo de confiança bilateral para a média: [13.14, 15.86]
# Como 15 está dentro do intervalo → não rejeita H0
