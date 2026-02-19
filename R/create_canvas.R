#' Create quiz
#' @description
#' Create a canvas quiz
#' @param canvas Authentication using [vvcanvas::canvas_authenticate()]
#' @param course_id id number of the course.
#' Go to your course home page and the number is at the end of the url.
#' @param quiz_params Quiz parameters.
#' You can make these with [collate_quiz_params()]
#' @returns A list with a canvas quiz.
#' @export

create_quiz <- function(canvas, course_id, quiz_params) {
  url <- paste0(
    canvas$base_url, "/api/v1/courses/", course_id, "/quizzes"
  )

  response <- httr::POST(
    url = url,
    config = httr::add_headers(
      Authorization = paste("Bearer", canvas$api_key)
    ),
    body = list(quiz = quiz_params),
    encode = "json"
  )
  if (httr::status_code(response) != 200) {
    stop("Failed to update quiz. Please check your authentication, course ID,
         quiz ID, and parameters. Response: ", httr::status_code(response))
  }
  updated_quiz <- httr::content(response, "parsed")
  updated_quiz
}

#' Create quiz question
#' @description
#' Create a canvas quiz question
#' @param canvas Authentication using [vvcanvas::canvas_authenticate()]
#' @param course_id id number of the course.
#' Go to your course home page and the number is at the end of the url.
#' @param quiz_id The id number of the quiz.
#' You can extract this from the output of [create_quiz()].
#' @param quiz_question_params Quiz question parameters.
#' You can make these with [collate_question_params()]
#' @returns A list with a canvas quiz.
#' @export

create_quiz_question <- function(
  canvas,
  course_id,
  quiz_id,
  quiz_question_params
) {
  url <- paste0(
    canvas$base_url, "/api/v1/courses/", course_id,
    "/quizzes/", quiz_id, "/questions"
  )
  response <- httr::POST(
    url = url,
    config = httr::add_headers(
      Authorization = paste("Bearer", canvas$api_key)
    ),
    body = list(question = quiz_question_params),
    encode = "json"
  )
  if (httr::status_code(response) != 200) {
    stop(
      "Failed to create quiz question.",
      "Please check your authentication, course ID, quiz ID, and parameters.",
      "Response:", httr::status_code(response)
    )
  }
  quiz_question <- httr::content(response, "parsed")
  quiz_question
}


get_quiz_questions <- function(canvas, course_id, quiz_id) {
  url <- paste0(
    canvas$base_url, "/api/v1/courses/", course_id,
    "/quizzes/", quiz_id, "/questions"
  )
  response <- httr::GET(
    url = url,
    config = httr::add_headers(
      Authorization = paste("Bearer", canvas$api_key)
    )
  )
  if (httr::status_code(response) != 200) {
    stop(
      "Failed to create quiz question.",
      "Please check your authentication, course ID, quiz ID, and parameters.",
      "Response:", httr::status_code(response)
    )
  }
  quiz_question <- httr::content(response, "parsed")
  quiz_question
}
