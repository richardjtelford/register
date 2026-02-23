# Collate quiz parameters

Collates and processes quiz parameters.

## Usage

``` r
collate_quiz_params(
  title = glue("Registration {today()}"),
  description = "Please press submit to register attendence",
  quiz_type = "graded_survey",
  unlock_at = NULL,
  due_at = NULL,
  ...
)
```

## Arguments

- title:

  Title of the quiz. Defaults to "Registration {Date}"

- description:

  Description text

- quiz_type:

  Type of quiz

- unlock_at:

  Optional. Set using
  [`iso8601()`](https://richardjtelford.github.io/register/reference/iso8601.md).

- due_at:

  Optional. Set using
  [`iso8601()`](https://richardjtelford.github.io/register/reference/iso8601.md).

- ...:

  Extra parameters. See details

## Value

A list

## Details

More information about each parameter from the [canvas API
documentation](https://developerdocs.instructure.com/services/canvas/resources/quizzes#method.quizzes/quizzes_api.create)
