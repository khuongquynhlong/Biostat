path <- "https://raw.githubusercontent.com/khuongquynhlong/Biostat/main/GLM/Assignments/"

#----- Read data
# Individual data
df_indi <- read.csv(paste0(path, "dehp_indi.csv"))

# Aggregated data
df_agg <- read.csv(paste0(path, "dehp_short.csv"))

head(df_indi)
head(df_agg)

#----- Logistic regressions
m_indi = glm(nadv ~ dose_scale, data = df_indi, family = binomial(link = "logit"))

m_agg = glm(cbind(nadv, litter_size-nadv) ~ dose_scale, data = df_agg, 
            family = binomial(link = "logit"))

summary(m_indi)
summary(m_agg)
