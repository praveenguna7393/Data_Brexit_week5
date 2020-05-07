#Beavers dataset
?beavers
str((beaver2))

#use the transform function
# to change active to a factor

transformed_beaver_data <- transform(beaver2,
                                     activ = factor(activ, labels = c("no","yes")))

transformed_beaver_data

#select the approprate data
#First step - check normalility of the data (Normal distribution)

library("lattice")
histogram(~temp | activ,
          data = transformed_beaver_data)

with(transformed_beaver_data,
     qqplot(temp[activ == "yes"],
            temp[activ == "no"],
            main = "comparing 2 samples",
            xlab = "Active temp = yes", ylab = "Active temp = no"))

# Using a qqplot and qqnorm function
with(transformed_beaver_data, 
     {qqnorm(temp[activ == "no"],
             main = "Inactive")
       qqline(temp[activ == "no"])
       })
# change active period to "yes"
with(transformed_beaver_data, 
     {qqnorm(temp[activ == "yes"],
             main = "Active")
       qqline(temp[activ == "yes"])
     })

#Formal test of normality
normalily_test <- shapiro.test(transformed_beaver_data$temp)
normalily_test$p.value

# p-value tells us the chances that the sample comes from a normal distribution.
# p-value is clearly less than 0.05
# so the data is not normally distributed.

# we can apply this test on all vars using tapply() function
with(transformed_beaver_data, tapply(temp, activ, shapiro.test))

#t test
t.test(temp ~ activ, data = transformed_beaver_data)

#use separate vectors for the samples that we want to compare
with(transformed_beaver_data,
     t.test(temp[activ == "yes"], temp[activ == "no"]))
# w test

wilcox.test(temp ~ activ, data = transformed_beaver_data)

