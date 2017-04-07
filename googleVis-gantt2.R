#source: https://www.packtpub.com/mapt/book/big-data-and-business-intelligence/9781783989508/2/ch02lvl1sec34/generating-an-interactive-gantt/timeline-chart-in-r

library(googleVis)

base = read.csv("disable.csv")
data = data.frame(position = as.character(base$position), 
                  player = as.character(base$player), 
                  start = as.POSIXct(base$start), 
                  end = as.POSIXct(base$end)
                  )

baseball = gvisTimeline(
  data = data, 
  rowlabel ="position",
  start ="start", 
  end = "end",
  barlabel ="player" , 
  option = list(width = 1000, 
                height = 900,
                timeline="{singleColor :'#002A3E'}")
  )
plot(baseball)