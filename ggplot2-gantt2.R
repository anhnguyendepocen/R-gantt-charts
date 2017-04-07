# source:http://stackoverflow.com/questions/3550341/gantt-charts-with-r
library(reshape2)
tasks <- c("Review literature", "Mung data", "Stats analysis", "Write Report")
dfrP <- data.frame(
  name        = factor(tasks, levels = tasks),
  start.date  = as.Date(c("2010-08-24", "2010-10-01", "2010-11-01", "2011-02-14")),
  end.date    = as.Date(c("2010-10-31", "2010-12-14", "2011-02-28", "2011-04-30")),
  is.critical = c(TRUE, FALSE, FALSE, TRUE)
)
dfrR <- data.frame(
  name        = factor(tasks, levels = tasks),
  start.date  = as.Date(c("2010-08-22", "2010-10-10", "2010-11-01", NA)),
  end.date    = as.Date(c("2010-11-03", "2010-12-22", "2011-02-24", NA)),
  is.critical = c(TRUE, FALSE, FALSE,TRUE)
)
mdfr <- merge(data.frame(type="Plan", melt(dfrP, measure.vars = c("start.date", "end.date"))),
              data.frame(type="Real", melt(dfrR, measure.vars = c("start.date", "end.date"))), all=T)

library(ggplot2)
ggplot(mdfr, aes(x=value, y=type, color=is.critical))+
  geom_line(size=6)+
  facet_grid(name ~ .) +
  scale_y_discrete(limits=c("Real", "Plan")) +
  xlab(NULL) + ylab(NULL)