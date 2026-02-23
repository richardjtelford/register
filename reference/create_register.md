# Create attendance quiz and qr code

Create attendance quiz and qr code

## Usage

``` r
create_register(
  course_id,
  accesscode = random_passcode(adjective_noun_list = adjective_noun$norsk),
  quiz_params = digit_code(),
  quiz_id
)
```

## Arguments

- course_id:

  id number of the course. Go to your course home page and the number is
  at the end of the url.

- accesscode:

  the accesscode. Defaults to a four digit code.

- quiz_params:

  Quiz parameters. You can make these with
  [`collate_quiz_params()`](https://richardjtelford.github.io/register/reference/collate_quiz_params.md)

- quiz_id:

  Optional id of an existing quiz to activate.
