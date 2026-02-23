# Collate quiz questions parameters

Collates quiz question parameters.

## Usage

``` r
collate_question_params(
  question_name = "qn",
  question_text = "Please enter the passcode",
  question_type = "short_answer_question",
  position = 1,
  correct_comments = "Thankyou",
  incorrect_comments = "Please check your passcode carefully",
  answers = NULL
)
```

## Arguments

- question_name:

  Name of the question

- question_text:

  Question text

- question_type:

  Type of question

- position:

  Integer setting question order

- correct_comments:

  Response for a correct answer

- incorrect_comments:

  Response for an incorrect answer

- answers:

  The correct answer(s). Optional. Can be a vector or a list with
  `answer_text` and optionally `answer_score`.

## Value

A list

## Details

More information about each parameter from the [canvas API
documentation](https://developerdocs.instructure.com/services/canvas/resources/quiz_questions#method.quizzes/quiz_questions.create)
