library('shiny')

shinyServer(function(input, output) {

  output$dist_plot = renderPlot({

    prior_mu    = input$'prior_mu'
    prior_sigma = input$'prior_sigma'
    data_mu     = input$'data_mu'
    data_sigma  = input$'data_sigma'
    n = 1

    y = seq(prior_mu - 5 * prior_sigma, prior_mu + 5 * prior_sigma, length.out = 100)

    set.seed(42)
    y_data = rnorm(n, data_mu, data_sigma)
    post_mu = ((prior_mu/prior_sigma^2) + ((sum(y_data))/data_sigma^2))/
      ((1/prior_sigma^2) + (n/data_sigma^2))
    post_sigma = sqrt(1/((1/prior_sigma^2) + (n/data_sigma^2)))

    y_prior = dnorm(y, prior_mu, prior_sigma)
    y_lik = dnorm(y, data_mu, data_sigma)
    y_post = dnorm(y, post_mu, post_sigma)

    y_max = max(c(y_prior, y_lik, y_post))

    plot(y, y_prior, type = 'l', lty = 2, ylab = 'density', ylim=c(0, y_max))
    lines(y, y_lik, type = 'l', col = 'blue')
    lines(y, y_post, type = 'l', col='red')

    legend('topright', col = c('black', 'blue', 'red'),
           lty = c(2, 1, 1), cex = 1, bty = 'n',
           legend = c('Prior', 'Likelihood', 'Posterior'))

  })

})
