#source: https://cran.r-project.org/web/packages/plan/vignettes/plan.pdf

library(plan)
data(burndown)
print(summary(burndown))
plot(burndown)

data(gantt)
print(summary(gantt))
plot(gantt)