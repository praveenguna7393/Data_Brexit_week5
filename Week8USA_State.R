# US dataset

?state.x77
str((state.x77))

head(state.x77)

class(state.x77)

state_df = as.data.frame(state.x77)
state_df
head(state_df)
colnames(state_df)

colnames(state_df)[colnames(state_df) == "Life Exp"] <- "Life_exp"
colnames(state_df)[colnames(state_df) == "HS Grad"] <- "HS_grade"

head(state_df)
pairs(state_df)
# This chart provides general level of detail on linearlity.
# We need to check in more detail with the independent var on x-axis.

attach(state_df)
scatter.smooth(x = Murder,
               y = Population,
               main = "Murder ~ Population",
               xlab = "Murder",
               ylab = "Population")

#Murder correlation
cor(Murder, Population)
# Low correlation -0.2 < x < 0.2

attach(state_df)
scatter.smooth(x = Murder,
               y = Illiteracy,
               main = "Murder ~ Illiteracy",
               xlab = "Murder",
               ylab = "Illiteracy")

#Murder correlation
cor(Murder, Illiteracy)

scatter.smooth(x = Murder,
               y = Income,
               main = "Murder ~ Income",
               xlab = "Murder",
               ylab = "Income")

#Murder correlation
cor(Murder, Income)







