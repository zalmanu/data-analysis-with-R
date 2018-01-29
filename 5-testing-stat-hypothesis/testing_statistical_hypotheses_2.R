library(UsingR)
data("babies")

babies = subset(babies, babies$gestation < 999 & babies$age < 99 & babies$dage < 99)

gt_smoker = babies$gestation[babies$smoke > 0 & babies$smoke < 9]
gt_non_smoker = babies$gestation[babies$smoke == 0]

boxplot(gt_non_smoker, gt_non_smoker)

t.test(gt_smoker, gt_non_smoker, mu=0, alt="t")

t.test(babies$age, babies$dage, mu=0, alt="t", paired = TRUE)
boxplot(babies$age, babies$dage)
