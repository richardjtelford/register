#' Create attendance quiz and qr code
#' @param course_id id number of the course.
#' Go to your course home page and the number is at the end of the url.
#' @param accesscode the accesscode. Defaults to a four digit code.
#' @param quiz_params Quiz parameters.
#' You can make these with [collate_quiz_params()]
#' @param quiz_id Optional id of an existing quiz to activate.

#' @importFrom vvcanvas canvas_authenticate update_quiz
#' @importFrom qrcode qr_code
#' @importFrom lubridate now
#' @importFrom grDevices dev.new
#' @export

create_register <- function(
  course_id,
  accesscode = random_passcode(adjective_noun_list = adjective_noun$norsk),
  quiz_params = digit_code(),
  quiz_id
) {
  # authenticate
  auth <- canvas_authenticate()

  # make quiz if ID not provided
  if (missing(quiz_id)) {
    quiz <- create_quiz(
      canvas = auth,
      course_id = course_id,
      quiz_params = quiz_params
    )

    # get quiz id
    quiz_id <- quiz$id
  }

  # publish quiz
  quiz <- activate_quiz(
    course_id = course_id,
    quiz_id = quiz_id,
    unlock_at = now(),
    access_code = accesscode
  )


  # get url
  quiz_url <- quiz$mobile_url
  # print qrcode + accesscode
  dev.new()
  plot_qrcode(url = quiz_url, main = "Please Register", accesscode = accesscode)

  invisible(list(quiz = quiz))
}
