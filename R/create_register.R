#' Create attendance quiz and qr code
#' @param course_id id number of the course.
#' Go to your course home page and the number is at the end of the url.
#' @param passcode the passcode
#' @param quiz_params Quiz parameters.
#' You can make these with [collate_quiz_params()]

#' @importFrom vvcanvas canvas_authenticate
#' @importFrom qrcode qr_code
#' @export

create_attendence <- function(
    course_id,
    passcode = random_passcode(adjective_noun_list = adjective_noun$norsk),
    quiz_params = collate_quiz_params()) {

  # authenticate
  auth <- canvas_authenticate()

  # make quiz
  quiz <- create_quiz(
    canvas = auth,
    course_id = course_id,
    quiz_params = quiz_params
  )

  # get quiz id
  quiz_id <- quiz$id
  # make question contents with passcode
  quiz_question_params <- collate_question_params(answers = passcode)
  # create question
  quest <- create_quiz_question(
    canvas = auth,
    course_id = course_id,
    quiz_id = quiz_id,
    quiz_question_params = quiz_question_params)

  # get url
  quiz_url <- quiz$mobile_url


  # print qrcode + passcode
  qr_code(quiz_url) |>
    plot_qrcode(main = "Please Register", passcode = passcode)
}



