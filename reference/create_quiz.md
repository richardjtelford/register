# Create quiz

Create a canvas quiz

## Usage

``` r
create_quiz(canvas, course_id, quiz_params)
```

## Arguments

- canvas:

  Authentication using
  [`vvcanvas::canvas_authenticate()`](https://vusaverse.github.io/vvcanvas/reference/canvas_authenticate.html)

- course_id:

  id number of the course. Go to your course home page and the number is
  at the end of the url.

- quiz_params:

  Quiz parameters. You can make these with
  [`collate_quiz_params()`](https://richardjtelford.github.io/register/reference/collate_quiz_params.md)

## Value

A list with a canvas quiz.
