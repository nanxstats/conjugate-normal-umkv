library("shiny")

shinyUI(fluidPage(

  # titlePanel('Bayesian inference for normal mean (known variance)'),

  sidebarLayout(
    sidebarPanel(
      width = 3,
      numericInput("y_data", label = "Observed data:", value = 56, step = 1L),
      numericInput("data_sigma", label = "Known variance of data:", value = 20, min = 0, step = 1L),
      hr(),
      numericInput("prior_mu", label = "Prior μ:", value = 80, step = 1L),
      numericInput("prior_sigma", label = "Prior σ:", value = 10, min = 0, step = 1L)
    ),
    mainPanel(
      width = 9,
      plotOutput("dist_plot")
    )
  )

))
