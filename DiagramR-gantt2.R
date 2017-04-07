#source: https://github.com/rich-iannone/DiagrammeR/issues/77
library(Diagrammer)
library(htmltools)

m1 <- mermaid('
              gantt
              title Gantt With Custom Config
              section To fix
              check with Rich         :a1, 2015-03-09, 2d
              add custom config param :a2, after a1, 20d
              get bresler feedback    :a3, after a2,  2d
              ',height = 200)

# make a copy so we can compare in a tag list later
m2 <- m1

m2$x$config = list(ganttConfig = list(
  # a little tricky setup in what is already a hack
  #  treat this like a filter function with filter as second component in array
  #  and the time formatter in the first
  #  more than likely you will want to know your scale
  axisFormatter = list(list(
    "%b %d, %Y" # date format to return; see d3 time formatting
    ,htmlwidgets::JS(
      'function(d){ return d.getDay() == 1 }' # filter for Mondays or day of week = 1
    )
  ))
))


html_print(tagList(
  tags$h1("Default Behavior")
  ,m1
  ,tags$h1("Hacked Behavior")
  ,m2
))
