# Create quiz question

Create a canvas quiz question

## Usage

``` r
create_quiz_question(canvas, course_id, quiz_id, quiz_question_params)
```

## Arguments

- canvas:

  Authentication using
  [`vvcanvas::canvas_authenticate()`](https://vusaverse.github.io/vvcanvas/reference/canvas_authenticate.html)

- course_id:

  id number of the course. Go to your course home page and the number is
  at the end of the url.

- quiz_id:

  The id number of the quiz. You can extract this from the output of
  [`create_quiz()`](https://richardjtelford.github.io/register/reference/create_quiz.md).

- quiz_question_params:

  Quiz question parameters. You can make these with
  [`collate_question_params()`](https://richardjtelford.github.io/register/reference/collate_question_params.md)

## Value

A list with a canvas quiz.
