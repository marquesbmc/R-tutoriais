if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(version = "3.15")

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install()

BiocManager::install(c("ALL"))
BiocManager::install(c("genefilter"))
BiocManager::install(c("hgu95av2.db"))
BiocManager::install(c("limma"))
BiocManager::install(c("MLInterfaces"))
BiocManager::install(c("GOstats"))


library(ALL)
data(ALL)
dim(ALL)
ALL
exp = exprs(ALL)
exp
varMetadata(ALL)

#####################

library(genefilter)
sds = rowSds(exp)
m = median(sds)
hist(sds, breaks = 50, col = "gray")
abline(v=m, col="red", lwd=4, lty=2)
abline(v=m*3, col="blue", lwd=4, lty=2)
ALLr = ALL[sds >= 3*median(sds),]
dim(ALLr)

#####################

varMetadata(ALLr)
expr = exprs(ALLr)
sdsr = rowSds(expr)
mr = median(sdsr)
hist(sdsr, breaks = 50, col = "gray")
  abline(v=mr, col="red", lwd=4, lty=2)
  abline(v=mr*2, col="blue", lwd=4, lty=2)
  
#####################
  
maximos = apply(exp, 1, max)
minimos = apply(exp, 1, min)
v1 = maximos/minimos > 2
ALLm2 = ALL[v1,]
ALLm2
exprm2 = exprs(ALLm2)
hist(exprm2, breaks = 50, col = "gray")

#####################

expm2 = exprs(ALLm2)
median(expm2)
sd(expm2 )
exprs(ALLm2) = scale(expm2)
xpz =exprs(ALLm2)
mean(exprs(ALLm2))
sd(exprs(ALLm2))

hist(xpz, breaks = 50, col = "gray")


##################### GITHUB connect

install.packages("usethis")
library(usethis)

usethis::use_git_config(user.name = "marquesbmc", # Seu nome
                        user.email = "marquesbmc@gmail.com") # Seu email


usethis::create_github_token()
usethis::edit_r_environ()
