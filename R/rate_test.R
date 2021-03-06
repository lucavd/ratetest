#' Test an event rate in two groups
#'
#' @param events_a number of events occurring the first group
#' @param events_b number of events occurring in the second group
#' @param y_person_a years (or months)-person for the first group
#' @param y_person_b years (or months)-person for the second group
#'
#' @return a tibble
#' @export
#'
#' @examples
#' rate_test(5,8,182.8,165.1)


rate_test <- function (events_a, events_b, y_person_a, y_person_b) {

  compare_rates <- rateratio.test(c(events_a, events_b), c(y_person_a, y_person_b))

  a <- pois.exact(events_a, y_person_a)

  b <- pois.exact(events_b, y_person_b)

  tot <- pois.exact((events_a + events_b), (y_person_a + y_person_b))

  output2 <- tibble::tribble(~var, ~rate, ~lower, ~upper, ~p.value,
                             "Rate Ratio", signif(tot$rate, digits = 3)*100,
                             signif(tot$lower, digits = 3)*100,
                             signif(tot$upper, digits = 3)*100,
                             paste0(signif(as.numeric(compare_rates[["p.value"]]), digits =5)),


                             "a", signif(a$rate, digits = 3)*100,
                             signif(a$lower, digits = 3)*100,
                             signif(a$upper, digits = 3)*100,
                             '',


                             "b", signif(b$rate, digits = 3)*100,
                             signif(b$lower, digits = 3)*100,
                             signif(b$upper, digits = 3)*100,
                             ''

  )


  output2

}
