rate_test <- function (events_a, events_b, y_person_a, y_person_b) {

  compare_rates <- rateratio.test::rateratio.test(c(events_a, events_b), c(y_person_a, y_person_b))

  a <- epitools::pois.exact(events_a, y_person_a)

  b <- epitools::pois.exact(events_b, y_person_b)

  tot <- epitools::pois.exact((events_a + events_b), (y_person_a + y_person_b))

  space <- ""

  output2 <- tibble::tribble(~var, ~rate, ~lower, ~upper, ~p.value,
                             "tot", signif(tot$rate, digits = 3)*100,
                             signif(tot$lower, digits = 3)*100,
                             signif(tot$upper, digits = 3)*100,
                             "",


                             "a", signif(a$rate, digits = 3)*100,
                             signif(a$lower, digits = 3)*100,
                             signif(a$upper, digits = 3)*100,
                             "",

                             "b", signif(b$rate, digits = 3)*100,
                             signif(b$lower, digits = 3)*100,
                             signif(b$upper, digits = 3)*100,
                             paste0(signif(as.numeric(compare_rates[["p.value"]]), digits =5))

  )


  output2

}
