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
#' @importFrom vvcanvas canvas_authenticate get_course_quizzes
#' get_course_students get_quiz_submissions
#' @importFrom dplyr mutate left_join join_by filter join_by
#' @importFrom purrr map2 list_rbind
#' @importFrom rlang .data
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
        mutate(title = .data$title)
    }
  ) |>
    list_rbind()

  attendance <- left_join(students, attendance, by = join_by(.data$id == .data$user_id)) |>
    filter(.data$name != "Test student")

  attendance
}


#' Summarise course attendance
#'
#' @param attendance Output of `get_course_attendance()`.
#' @importFrom dplyr distinct summarise
#' @importFrom rlang .data
#' @export
#'
summarise_attendance <- function(attendance) {
  attendance |>
    distinct(.data$name, .data$title) |>
    summarise(n = sum(!is.na(.data$title)), .by = "name")
}

#' Plot course attendance
#' @param attendance Output of `get_course_attendance()`.
#' @param lowest Show the n students with the lowest attendance (to prevent the plot being overwhelming). Use `Inf` to show all students.
#' @importFrom ggplot2 ggplot aes geom_raster scale_x_discrete theme
#' element_blank
#' @importFrom dplyr distinct mutate slice_min
#' @importFrom forcats fct_reorder
#' @importFrom rlang .data
#' @export

plot_attendance <- function(attendance, lowest = 20) {
  attendance |>
    distinct(.data$name, .data$title) |>
    mutate(n = sum(!is.na(.data$title)), .by = "name") |>
    mutate(name = factor(.data$name), name = fct_reorder(.data$name, -n)) |>
    slice_min(.data$n, n = lowest, with_ties = FALSE) |>
    ggplot(aes(x = .data$title, y = .data$name)) +
    geom_raster() +
    scale_x_discrete(na.translate = FALSE, labels = scales::label_wrap(15)) +
    theme(axis.title = element_blank())
}

