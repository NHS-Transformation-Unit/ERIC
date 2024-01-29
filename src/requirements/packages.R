packages <- c("here",
              "tidyverse",
              "openxlsx",
              "leaflet",
              "sf",
              "shiny",
              "plotly",
              "markdown",
              "knitr",
              "scales")


lapply(packages, library, character.only=TRUE)
