# Activate quiz

Activates pre-existing quiz (perhaps made with
[`create_quiz()`](https://richardjtelford.github.io/register/reference/create_quiz.md))
by setting unlock time, due time and publishes it.

## Usage

``` r
activate_quiz(
  course_id,
  quiz_id,
  unlock_at,
  time_open = minutes(10),
  access_code = NULL
)
```

## Arguments

- course_id:

  id number of the course. Go to your course home page and the number is
  at the end of the url.

- quiz_id:

  The id number of the quiz. This is the number at the end of the quiz
  url.

- unlock_at:

  date-time to unlock quiz - defaults to current time (Canvas accepts
  times in ISO 8601 format, e.g. 2011-10-21T18:48Z). You can use
  [`iso8601()`](https://richardjtelford.github.io/register/reference/iso8601.md)
  to format the date-time correctly.

- time_open:

  time to keep quiz open (in minutes) - default to ten minutes. Set to
  NULL to keep quiz open

- access_code:

  Optional access code for the quiz

## Value

A quiz object (invisible)
