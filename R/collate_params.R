#' Collate quiz parameters
#'
#' @description
#' Collates and processes quiz parameters.
#'
#' @param title Title of the quiz. Defaults to "Registration \{Date\}"
#' @param description Description text
#' @param quiz_type Type of quiz
#' @param due_at Optional. Set using [iso8601()].
#' @param unlock_at Optional. Set using [iso8601()].
#' @param \dots Extra parameters. See details
#' @details More information about each parameter from the
#' [canvas API documentation](https://developerdocs.instructure.com/services/canvas/resources/quizzes#method.quizzes/quizzes_api.create)
#' @returns A list
#' @importFrom glue glue
#' @importFrom lubridate today
#' @importFrom purrr discard
#' @export

collate_quiz_params <- function(
  title = glue("Registration {today()}"),
  description = "Please register your attendence with the passcode",
  quiz_type = "graded_survey",
  unlock_at = NULL,
  due_at = NULL,
  ...
) {
  # return list
  list(
    title = title,
    description = description,
    quiz_type = quiz_type,
    due_at = due_at,
    unlock_at = unlock_at,
    ...
  ) |>
    discard(is.null)
}

#' Collate quiz questions parameters
#'
#' @description
#' Collates quiz question parameters.
#'
#' @param question_name Name of the question
#' @param question_text Question text
#' @param question_type Type of question
#' @param position Integer setting question order
#' @param correct_comments Response for a correct answer
#' @param incorrect_comments Response for an incorrect answer
#' @param answers The correct answer(s). Optional.
#' Can be a vector or a list with `answer_text` and optionally `answer_score`.
#' @details More information about each parameter from the
#' [canvas API documentation](https://developerdocs.instructure.com/services/canvas/resources/quiz_questions#method.quizzes/quiz_questions.create)
#' @importFrom purrr map discard
#' @returns A list
#' @export

collate_question_params <- function(
  question_name = "qn",
  question_text = "Please enter the passcode",
  question_type = "short_answer_question",
  position = 1,
  correct_comments = "Thankyou",
  incorrect_comments = "Please check your passcode carefully",
  answers = NULL
) {
  # make return list
  params <- list(
    question_name = question_name,
    question_text = question_text,
    question_type = question_type,
    position = position,
    correct_comments = correct_comments,
    incorrect_comments = incorrect_comments
  ) |>
    discard(is.null)
  if (!is.null(answers)) {
    if (is.list(answers)) {
      params$answers <- answers
    } else {
      params$answers <- map(answers, \(x) list(answer_text = x))
    }
  }

  params
}

#' ISO8601
#' @description
#' Formats date in ISO8601 date time format with timezone.
#' @param datetime Date-time object (POSIXct class) for
#' example made with [lubridate::now()].
#' @param offset Offset period for example made with [lubridate::minutes()].
#' @importFrom lubridate with_tz now minutes
#' @export
iso8601 <- function() {
  if (!missing(offset)) {
    datetime <- datetime + offset
  }
  datetime <- with_tz(datetime, tzone = "UTC")
  datetime <- strftime(datetime, "%Y-%m-%dT%H:%M:%S%z")
  datetime
}
