## ----include=F-----------------------------------------------------------
knitr::knit_hooks$set(margin = function(before,options,envir) {
if(before) par(mgp=c(1.5,0.5,0),bty="n",plt=c(.105,.97,.13,.97)) else NULL })

knitr::opts_chunk$set(margin=T,prompt=T,comment="",collapse=T,cache=F,
dev.args=list(pointsize=11),fig.height=3.5,
fig.width=4.24725,fig.retina=2,fig.align="center")

## ----eval = FALSE--------------------------------------------------------
#  # install.packages("devtools")
#  devtools::install_bitbucket("choisy/worldpopVN", build_vignettes = TRUE)

## ------------------------------------------------------------------------
library(worldpopVN)

## ------------------------------------------------------------------------
wpop <- getpop()

## ------------------------------------------------------------------------
wpop

## ----eval = F------------------------------------------------------------
#  plot(wpop)

