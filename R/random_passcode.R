#' Make a random passcode
#' @description
#' Makes a random passcode by sampling a list of adjectives and nouns
#' @param adjective_noun_list A list with adjectives and nouns.
#' See [adjective_noun].
#' @details
#' Random adjective-noun combinations are often used to generate e.g. user names.
#' @returns A length-one character vector.
#' @importFrom purrr map
#' @export
random_passcode <- function(adjective_noun_list = adjective_noun$norsk) {
  adjective_noun_list |>
    map(\(w) sample(w, size = 1)) |>
    unlist() |>
    paste(collapse = " ")
}


#' A list with adjective and nouns
#'
#' @format A list
#' \describe{
#'   \item{norsk}{A list of Norwegian adjectives and nouns
#'   (mammals and birds) without special characters.}
#'   \item{english}{A list of English adjectives and nouns.}

#' }
#' @name adjective_noun
NULL
