library('shiny')

shinyUI(fluidPage(

  # titlePanel('Bayesian inference for normal mean (known variance)'),

  sidebarLayout(
    sidebarPanel(

      numericInput("prior_mu", label = "Prior: μ", value = 72),
      numericInput("prior_sigma", label = "Prior: σ", value = 10, min = 1e-6),
      hr(),
      numericInput("data_mu", label = "Data: μ", value = 68),
      numericInput("data_sigma", label = "Data: σ", value = 20, min = 1e-6)

    ),

    mainPanel(
      plotOutput("dist_plot")
    )
  )

))
