library(Rmisc)
library(ggplot2)
library(dplyr)

# Simulação do salário da população de 1.000 funcionários
base = data.frame(rnorm(100000,mean=5000,sd=500))
colnames(base) = "salario"
plot(density(base$salario),xlim=c(3000,7000))

# Gerar automaticamente 100 intervalos
n = 100
amostra30 = data.frame(matrix(nrow = n, ncol = 3)) 
colnames(amostra30) <- c("Media","LI","LS")
for (i in 1:n){
  Amostra = data.frame(base[sample(nrow(base),30),])
  colnames(Amostra) = 'Salario'
  IC = CI(Amostra$Salario, ci=0.95)
  amostra30[i,1] = IC[2]
  amostra30[i,2] = IC[3]
  amostra30[i,3] = IC[1]
}
amostra30$seq = seq(1:nrow(amostra30))
amostra30 = amostra30 %>% mutate(Capture = ifelse(LI < mean(base$salario), ifelse(LS > mean(base$salario), 1, 0), 0))
amostra30$Capture = as.factor(amostra30$Capture)

colorset = c('0'='red','1'='black')
ggplot(amostra30, aes(x = seq, y = Media)) + 
  geom_point(aes(color = Capture)) + 
  geom_errorbar(aes(ymin = LI, ymax = LS, color = Capture)) + 
  scale_color_manual(values = colorset) + 
  coord_flip() + 
  geom_hline(yintercept = mean(base$salario), linetype = "dashed", color = "blue") + 
  labs(title = "Intervalo de 95% de Confiança") + 
  theme(plot.title = element_text(hjust = 0.5)) + 
  ylim(4000,6000)

