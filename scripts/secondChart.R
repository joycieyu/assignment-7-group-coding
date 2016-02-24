# Require the plotly library to graph/plot 
require(plotly)

# Function that takes in a data set and returns a plotly graphic. The x axis contains 
# info about how well people understood the terminal. The color also indicates people's
# familiarity with using git for version control.
make_plot <- function(data) {
  x <- list(title = "Understanding the Terminal")
  y <- list(title = "Number of People")
  plot_ly(data,
          type = "scatter",
          x = Using.the.command.line...terminal, 
          mode = "markers",
          color = What.is.your.familiarity.with..using.git.for.version.control) %>% 
    layout(xaxis = x, yaxis = y)
}

