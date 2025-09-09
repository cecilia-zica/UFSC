rbvn<-function (n, mu1, s1, mu2, s2, rho){
  X1 <- rnorm(n, mu1, s1)
  X2 <- rnorm(n, mu2 + (s2/s1) * rho * (X1 - mu1), sqrt((1 - rho^2)*s2^2))
  cbind(X1, X2)
}
dados <- data.frame(rbvn(1000,1.60,0.09,60,8,0.70))
colnames(dados) <- c("Altura","Peso")

library(sampling)
dados$ID <- seq(1:nrow(dados))
r30 <- c()
n = 10000
for (i in 1:n){
  ASA <- dados[sample(nrow(dados), size=30), ]
  r30[i] <- cor(ASA$Altura,ASA$Peso)
}
hist(r30, col='steelblue', main='Simulação de 10.000 amostras')
abline(v=0.7,col="red",lwd=4)
