# Get course attendance

Collates attendance records for each student.

## Usage

``` r
get_course_attendance(course_id, pattern = "^Registration")

summarise_attendance(attendance)

plot_attendance(attendance, lowest = 20)
```

## Arguments

- course_id:

  id number of the course. Go to your course home page and the number is
  at the end of the url.

- pattern:

  Regular expression to identify registration quizzes.

- attendance:

  Output of `get_course_attendance()`.

- lowest:

  Show the n students with the lowest attendance (to prevent the plot
  being overwhelming). Use `Inf` to show all students.

## Value

A data.frame

## Examples

``` r
if (FALSE) { # \dontrun{
attendance <- get_course_attendance(course_id = "57351")
summarise_attendance(attendance)
plot_attendance(attendance)
} # }
```
