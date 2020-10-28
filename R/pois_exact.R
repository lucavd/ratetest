# this function is from the package 'epitools' v. 0.5-10.1 by Thomas J. Aragon
# https://cran.rstudio.com/web/packages/epitools/index.html
# included as is to avoid dependencies and enhance reproducibility over time


#' Confidence intervals for Poisson counts or rates
#'
#' @param x
#' @param pt
#' @param conf.level
#'
#' @return
#' @export
#'
#' @examples
#' pois.exact(x, pt = 1, conf.level = 0.95)

pois.exact <- function (x, pt = 1, conf.level = 0.95)
{
  xc <- cbind(x, conf.level, pt)
  pt2 <- xc[, 3]
  results <- matrix(NA, nrow(xc), 6)
  f1 <- function(x, ans, alpha = alp) {
    ppois(x, ans) - alpha/2
  }
  f2 <- function(x, ans, alpha = alp) 1 - ppois(x, ans) + dpois(x,
                                                                ans) - alpha/2
  for (i in 1:nrow(xc)) {
    alp <- 1 - xc[i, 2]
    interval <- c(0, xc[i, 1] * 5 + 4)
    uci <- uniroot(f1, interval = interval, x = xc[i, 1])$root/pt2[i]
    if (xc[i, 1] == 0) {
      lci <- 0
    }
    else {
      lci <- uniroot(f2, interval = interval, x = xc[i,
                                                     1])$root/pt2[i]
    }
    results[i, ] <- c(xc[i, 1], pt2[i], xc[i, 1]/pt2[i],
                      lci, uci, xc[i, 2])
  }
  coln <- c("x", "pt", "rate", "lower",
            "upper", "conf.level")
  colnames(results) <- coln
  data.frame(results)
}
