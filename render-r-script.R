#'---
#'title: "Render R script"
#'author: "Julian Martinez"
#'date: "4/3/2022"
#'output: github_document
#'---

#'## Render an R script.
#'
#'In R scripts, code is top-level and prose is tucked into comments. You will use `#'` to request that certain comments appear as top-level prose in the rendered output.
#'
#'Use `#+` to treat a line as a chunk header.

#+ skim
skimr::skim(iris)


plot(pressure)

#'Render the R script through one of these methods:
#'- In RStudio, do File -> Compile Report
#'- In R, do rmarkdown::render("PATH TO YOUR SCRIPT.R").