# Loading packages

require(tidyverse)
require(lme4)
require(optimx)
require(emmeans)

# Loading the dataset

data = readxl::read_xlsx("structural_priming_data.xlsx")

# Descriptive statistics

Clitic_Sum = data %>%
  group_by(TYPE_OF_SPEAKER, CODE, PHASE) %>%
  summarize(CLITIC_COUNT = sum(CLITIC == "yes"), 
            CLITIC_PERCENT = sum(CLITIC == "yes")/(length(CLITIC))*100)

Clitic_Descriptive = Clitic_Sum %>%
  group_by(TYPE_OF_SPEAKER, PHASE) %>%
  summarise(CLITICS_Mean = mean(CLITIC_COUNT), 
            CLITICS_SD = sd(CLITIC_COUNT), 
            CLITICS_Median = median(CLITIC_COUNT), 
            CLITICS_Max = max(CLITIC_COUNT), 
            CLITICS_Min = min(CLITIC_COUNT))

Clitic_Prop_Perc = data %>%
  group_by(TYPE_OF_SPEAKER, PHASE) %>%
  summarize(CLITIC_Count = sum(CLITIC == "yes"), 
            CLITIC_Percentage = sum(CLITIC == "yes")/(length(CLITIC))*100, 
            CLITIC_Proportion = sum(CLITIC == "yes")/length(CLITIC))

Clitic_Descriptive_Quant_Qual = merge(Clitic_Descriptive, Clitic_Prop_Perc, by=c("TYPE_OF_SPEAKER", "PHASE"))

# Plotting the data

Clitic_Sum$PHASE = as.factor(Clitic_Sum$PHASE)

Clitic_Descriptive_Quant_Qual %>% 
  dplyr::mutate(TYPE_OF_SPEAKER = factor(TYPE_OF_SPEAKER, levels = c("L1", "HS", "L2"))) %>%
  ggplot(aes(Clitic_Descriptive_Quant_Qual, x=PHASE, y=CLITICS_Mean)) + 
  geom_line(size=2) + 
  labs(x = "Phase", y = "Number of clitics produced") + 
  facet_wrap( ~ TYPE_OF_SPEAKER) + 
  geom_point() + 
  geom_errorbar(aes(ymin=CLITICS_Mean-CLITICS_SD, ymax=CLITICS_Mean+CLITICS_SD), width=.1) + 
  theme(text = element_text(size=20)) + 
  theme_bw() + scale_colour_grey() + 
  theme(legend.text=element_text(size=15)) + 
  theme(axis.text=element_text(size=20),
        axis.title=element_text(size=15,face="bold"))

# Inferential statistics

  # Transforming the data

data$REPETITION = as.factor(data$REPETITION)
data$TYPE_OF_SPEAKER = as.factor(data$TYPE_OF_SPEAKER)
data$CLITIC = as.factor(data$CLITIC)
data$PHASE = factor(data$PHASE, ordered = F)

  # Mixed-effects binomial logistic regression model (type of speaker and phase)

data$TYPE_OF_SPEAKER = relevel(data$TYPE_OF_SPEAKER, ref = "L1")
glm_1 = lme4::glmer(CLITIC~TYPE_OF_SPEAKER*PHASE + (1|CODE) + (1|SENTENCE), 
                     data = data, family = "binomial", 
                     control=glmerControl(optimizer="bobyqa", optCtrl = list(maxfun = 2e5)))
summary(glm_1)

  # Estimated marginal means from glm_1

pairs(emmeans(glm_1, "PHASE", by = "TYPE_OF_SPEAKER"))

  # Mixed-effects binomial logistic regression model (lexical repetition)

priming_ph2 = data %>%
subset(PHASE == "2")

priming_ph2$TYPE_OF_SPEAKER <- relevel(priming_ph2$TYPE_OF_SPEAKER, ref = "L1")
glm_2 = lme4::glmer(CLITIC~TYPE_OF_SPEAKER*REPETITION + (1|CODE) + (1|SENTENCE), 
                      data = priming_ph2, family = "binomial")
summary(glm_2)
