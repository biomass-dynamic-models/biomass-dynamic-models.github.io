
library(ggplot2)
library(dplyr)

# values
r <- 0.1
K <- 100
b <- seq(0, K, 1e-3)
rlim <- function(b) dbdt(b) * (1/b)

# empty dataframe
dfr <- data.frame() 

# Schaefer model
dbdt <- function(b) r * b * (1 - b/K)
dfr <- rbind(dfr,data.frame(biomass = b,
                  production = dbdt(b),
                  growth = rlim(b),
                  model = 'Schaefer'))

# P-T model
dbdt <- function(b) r/p * b * (1 - (b/K)^p)
p <- 0.2
dfr <- rbind(dfr,data.frame(biomass = b,
                            production = dbdt(b),
                            growth = rlim(b),
                            model = 'Pella-Tomlinson'))

# fletcher model
dbdt <- function(b) g * m * b/K * (1 - (b/K)^(n-1))
n <- 1.1881
bmsy <- (1/n)^(1/(n-1)) * K
h <- 2*bmsy
m <- r*h/4
g <- (n^(n/(n-1)))/(n-1)
dfr <- rbind(dfr,data.frame(biomass = b,
                            production = dbdt(b),
                            growth = rlim(b),
                            model = 'Fletcher'))

# Fletcher-Schaefer model
dbdt <- function(b) {
    bf <- b[which(b>bmsy)]
    bs <- b[which(b<=bmsy)]
    c(r * bs * (1 - bs/h),g * m * bf/K * (1 - (bf/K)^(n-1)))
}
dfr <- rbind(dfr,data.frame(biomass = b,
                            production = dbdt(b),
                            growth = rlim(b),
                            model = 'Fletcher-Schaefer'))

gg1 <- ggplot(dfr) + 
    geom_line(aes(x = biomass / K, y = production, col = model), linewidth = 1) + 
    labs(x = 'Biomass depletion', y = 'Surplus Production', col = 'Model') +
    theme_bw(base_size = 16)

gg2 <- ggplot(dfr) + 
    geom_line(aes(x = biomass / K, y = growth, col = model), linewidth = 1) + 
    labs(x = 'Biomass depletion', y = 'Production per unit biomass', col = 'Model') +
    theme_bw(base_size = 16)

gg <- ggpubr::ggarrange(gg1, gg2, common.legend = TRUE, legend = "bottom")
ggsave(gg, file = "fig1.png", width = 14, height = 5)



