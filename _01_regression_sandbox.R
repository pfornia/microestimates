library(dplyr)

filename <- "../data/brfss2014clean.csv"
brfssRaw <- read.csv(filename, na.strings = "")

brfss <- mutate(brfssRaw,
                state = as.factor(state),
                heart_attack = as.integer(heart_attack) - 1, 
                heart_disease = as.integer(heart_disease) - 1,
                diabetes = as.integer(diabetes) - 1
                )

modelLogit <- glm(diabetes ~ name + age + income + sex + race, data = brfss, family = "binomial",
                  contrasts = list(name = "contr.sum"))
