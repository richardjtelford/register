#' Get course attendance
#'
#' @description
#' Collates attendance records for each student.
#'
#' @param course_id id number of the course.
#' Go to your course home page and the number is at the end of the url.
#' @param pattern Regular expression to identify registration quizzes.
#' @returns A data.frame
#' @examples
#' \dontrun{
#' attendance <- get_course_attendance(course_id = "57351")
#' attendance |>
#'   group_by(name) |>
#'   distinct(title) |>
#'   separate_wider_delim(title, delim = " ", names = c("title", "date")) |>
#'   summarise(n = sum(!is.na(date)))
#' }
#' @importFrom vvcanvas canvas_authenticate get_course_students
#'  get_quiz_submissions
#' @importFrom dplyr mutate left_join join_by
#' @importFrom purrr map2 list_rbind
#' @export

get_course_attendance <- function(course_id, pattern = "^Registration") {
  # authenticate
  auth <- canvas_authenticate()

  # get registration quiz id
  course_quizzes <- get_course_quizzes(canvas = auth, course_id = course_id)
  registration_quizzes <- course_quizzes[grepl(pattern = pattern, x = course_quizzes$title), c("id", "title")]
  if (nrow(registration_quizzes) == 0) {
    stop("No registration quizzes identified")
  }

  # get enrolled students
  students <- get_course_students(canvas = auth, course_id = course_id)

  # get submissions for each course
  attendance <- map2(
    course_quizzes$id, course_quizzes$title,
    \(quiz_id, title) {
      get_quiz_submissions(canvas = auth, course_id = course_id, quiz_id = quiz_id) |>
        mutate(title = title)
    }
  ) |>
    list_rbind()

  attendance <- left_join(students, attendance, by = join_by(id == user_id))

  attendance
}
