#' Activate quiz
#' @description
#' Activates pre-existing quiz (perhaps made with [create_quiz()])
#' by setting unlock time, due time and publishes it.
#' @param course_id id number of the course.
#' Go to your course home page and the number is at the end of the url.
#' @param quiz_id The id number of the quiz.
#' This is the number at the end of the quiz url.
#' @param unlock_at date-time to unlock quiz - defaults to current time
#' (Canvas accepts times in ISO 8601 format, e.g. 2011-10-21T18:48Z).
#' You can use [iso8601()] to format the date-time correctly.
#' @param time_open time to keep quiz open (in minutes) -
#' default to ten minutes.
#' Set to NULL to keep quiz open
#' @param access_code Optional access code for the quiz
#' (use as an alternative to setting a passcode within the quiz).
#' @returns A quiz object (invisible)
#' @importFrom vvcanvas update_quiz
#' @importFrom lubridate minutes
#' @importFrom purrr discard
#' @export

activate_quiz <- function(course_id, quiz_id, unlock_at,
                          time_open = minutes(10), access_code = NULL) {
  # authenticate
  auth <- canvas_authenticate()

  if (!is.null(time_open)) {
    due_time <- unlock_at + time_open
  }
  # collate params
  quiz_params <- list(
    unlock_at = unlock_at,
    due_time = due_time,
    access_code = access_code,
    published = TRUE
  ) |>
    discard(is.null)

  # update quiz
  quiz <- update_quiz(
    canvas = auth,
    course_id = course_id,
    quiz_id = quiz_id,
    quiz_params = quiz_params
  )


  invisible(quiz)
}
