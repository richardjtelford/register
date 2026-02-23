# register

The goal of register is to make it easy to register attendance in
compulsory classes using canvas quizzes.

## Installation

You can install the development version of register like so:

``` r
# install.packages("pak") # install if necessary
pak::pak("richardjtelford/register")
```

## Setup

You need a canvas API token for authentication. To get a token, log into
your canvas installation (e.g. mitt.uib.no), then go to Account \>\>
Settings. Scroll down slightly and click “New access token”. Fill in the
form and click “Generate token”. This will then show you a token. Make a
copy of the token (which may span two lines) - canvas will never show
you this again.

Then open the .Renviron file with

``` r
usethis::edit_r_environ()
```

Edit the file to add `CANVAS_API_KEY` for the token, and
`CANVAS_BASE_URL` for the url of the canvas installation.

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

The function
[`create_register()`](https://richardjtelford.github.io/register/reference/create_register.md)
will create a quiz in your course with an access code; activate the quiz
with a ten minute deadline; and produce a QR code that links to the quiz
and shows the access code.

The only argument that needs to be set is `course_id`. You can find this
by going to the home page of your course and copying the numbers at the
end of the url.

``` r
bio302 <- 57351
create_register(course_id = bio302)
```

If you already have a quiz on canvas, you can activate it with
[`activate_quiz()`](https://richardjtelford.github.io/register/reference/activate_quiz.md)

``` r
activate_quiz(course_id = bio302, quiz_id = 1234)
```

By default, this will activate the quiz immediately, and set a due date
for ten minutes time.

You can also make a QR code for existing quizzes.

``` r
plot_qrcode("https://mitt.uib.no/courses/57351/quizzes/57912", main = "Do this quiz")
```

Use
[`get_course_attendance()`](https://richardjtelford.github.io/register/reference/get_course_attendance.md)
to download the registrations (you can also see this information on
canvas).
[`summarise_attendance()`](https://richardjtelford.github.io/register/reference/get_course_attendance.md)
and
[`plot_attendance()`](https://richardjtelford.github.io/register/reference/get_course_attendance.md)
with summarise and plot the result. The summarise and plot functions are
simple, use them for inspiration if you need something more complex.
