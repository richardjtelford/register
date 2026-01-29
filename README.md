
# register

<!-- badges: start -->
<!-- badges: end -->

The goal of register is to make it easy to register attendance in compulsory classes using canvas quizzes.

## Installation

You can install the development version of register like so:

``` r
# install.packages("pak") # install if necessary
pak::pak("richardjtelford/register")
```

## Setup

You need a canvas API token for authentication. 
To get a token, log into your canvas installation (e.g. mitt.uib.no), 
then go to Account >> Settings. 
Scroll down slightly and click "New access token". Fill in the form and click 
"Generate token". 
This will then show you a token. 
Make a copy of the token (which may span two lines) - canvas will never show 
you this again.

Then open the .Renviron file with

``` r
usethis::edit_r_environ()
```

Edit the file to add `CANVAS_API_KEY` for the token, and `CANVAS_BASE_URL` for the url of the canvas installation.

The .Renviron file should look something like


``` file
CANVAS_API_KEY=abcdef123456
CANVAS_BASE_URL=https://mitt.uib.no
```

Save and close this file.

You can check everything is set up correctly with

``` r
vvcanvas::canvas_authenticate()
```

which will throw an error if your token or url are incorrect.

## Using `register`

Start by loading the package.

``` r
library(register)
```

The function `create_attendence()` will create a quiz in your course with a question asking for a passcode; activate the quiz with a ten minute deadline; produce a qrcode that links to the quiz and shows the passcode.

The only argument that needs to be set is `course_id`. 
You can find this by going to the home page of your course and copying the numbers at the end of the url.

``` r
create_register(course_id = 57351)
```

If you already have a quiz on canvas, you can activate it with `activate_quiz()`

``` r
activate_quiz(course_id = 57351, quiz_id = 1234)
```

By default, this will activate the quiz immediately, and set a due date for ten minutes time.

You can also make a barcode for existing quizes.

``` r
qrcode::qr_code(x = "https://mitt.uib.no/courses/57351/quizzes/57912") |> 
  plot_qrcode(main = "Do this quiz")
```

## Comming soon (maybe)

1) Download register (if canvas does not display the results in a useful way).
2) ?????
