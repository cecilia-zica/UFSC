Base = datasets::airquality

Base = Base[,c(1:4)]

#Grafico
plot(Base)

# Coeficiente de correlacao
cor(na.omit(Base))
correlacao <- cor(na.omit(Base))

# Matriz do correlacao
library(ggcorrplot)
ggcorrplot(correlacao)
ggcorrplot(correlacao, hc.order = TRUE, type = "lower",
           lab = TRUE)

library(corrplot)
corrplot.mixed(correlacao, order = 'AOE')

