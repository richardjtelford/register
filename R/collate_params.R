#' Collate quiz parameters
#'
#' @description
#' Collates and processes quiz parameters.
#'
#' @param title Title of the quiz. Defaults to "Registration \{Date\}"
#' @param description Description text
#' @param quiz_type Type of quiz
#' @param due_at Deadline for quiz. Defaults to 10 minutes in the future.
#' @param \dots Extra parameters. See details
#' @details More information about each parameter from the [canvas API documentation](https://developerdocs.instructure.com/services/canvas/resources/quizzes#method.quizzes/quizzes_api.create)
#' @returns A list
#' @importFrom glue glue
#' @importFrom lubridate today now minutes with_tz
#' @export

collate_quiz_params <- function(
    title = glue("Registration {today()}"),
    description = "Please register your attendence with the passcode",
    quiz_type = "graded_survey",
    due_at = now() + minutes(10),
    ...) {
  # convert due at to correct format
  due_at <- with_tz(due_at, tzone = "UTC")
  due_at <- strftime(due_at, "%Y-%m-%dT%H:%M:%S%z")

  # return list
  list(
    title = title,
    description = description,
    quiz_type = quiz_type,
    due_at = due_at,
    ...
  )
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
#' @param answers The correct answer
#' @details More information about each parameter from the [canvas API documentation](https://developerdocs.instructure.com/services/canvas/resources/quiz_questions#method.quizzes/quiz_questions.create)
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
  )
  if(!is.null(answers)){
    params$answers <- glue("[{{\"answer_text\" = \"{answers}\"}}]")
  }

  params
}
