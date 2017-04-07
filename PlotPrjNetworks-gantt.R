# source:http://stackoverflow.com/questions/3550341/gantt-charts-with-r
library(PlotPrjNetworks)
project1=data.frame(
  task=c("Market Research","Concept Development","Viability Test",
         "Preliminary Design","Process Design","Prototyping","Market Testing","Final Design",
         "Launching"),
  start=c("2015-07-05","2015-07-05","2015-08-05","2015-10-05","2015-10-05","2016-02-18",
          "2016-03-18","2016-05-18","2016-07-18"),
  end=c("2015-08-05","2015-08-05","2015-10-05","2016-01-05","2016-02-18","2016-03-18",
        "2016-05-18","2016-07-18","2016-09-18"))
project2=data.frame(
  from=c(1,2,3,4,5,6,7,8),
  to=c(2,3,4,5,6,7,8,9),
  type=c("SS","FS","FS","SS","FS","FS","FS","FS"),
  delay=c(7,7,7,8,10,10,10,10))
GanttChart(project1,project2)