Base <- read.csv2('ceramica.csv')

#Grafico
plot(Base)

# Coeficiente de correlacao
cor(Base)
correlacao <- cor(Base)

# Grafico da Matriz do correlacao
library(ggcorrplot)
ggcorrplot(correlacao)
ggcorrplot(correlacao, hc.order = TRUE, type = "lower",
           lab = TRUE)

# Grafico da Matriz do correlacao (outras opcoes graficas)
# https://cran.r-project.org/web/packages/corrplot/vignettes/corrplot-intro.html
library(corrplot)
corrplot(cor(Base), method = 'number')
corrplot(cor(Base), method = 'color', order = 'alphabet')
corrplot(cor(Base))
corrplot(cor(Base), method = 'ellipse', order = 'AOE', type = 'upper')
corrplot.mixed(cor(Base), order = 'AOE')

