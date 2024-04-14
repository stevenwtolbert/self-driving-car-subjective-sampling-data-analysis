library('psych')
library('REdaS')
library('dplyr')
library('lavaan')
library('lavaanPlot')
library('semPlot')
library('semTools')
global_items <- read.csv('/Users/stolbert/code/self-driving-car-subjective-sampling-data-analysis/data-cleaning/scales/aidmt_global.csv')
# dba_nhw <- global_items[,6:10]
# dba_hw <- global_items[,1:5]
# global_items <- cbind(dba_nhw[1], dba_nhw[-1] + dba_hw[-1])
# global_items <- dba_sum[,1:ncol(dba_sum)]/2

colnames(global_items) <- c(1:16)
colnames(global_items) <- paste("x",colnames(global_items), sep = '')
model <- 'AIDMT=~ x1+x2+x3+x4+x5+x6 

'
fit <- cfa(model, data = global_items, std.lv=T, ordered=T, estimator='WLSMV')
summary(fit, standardized = TRUE, fit.measures = TRUE)
parameterEstimates(fit, standardized = TRUE)
semPaths(fit, what = 'paths', whatLabels = 'stand')
reliability(fit)

modindices(fit, minimum.value = 1, sort = TRUE)
