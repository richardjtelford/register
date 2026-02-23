# Make a random passcode

Makes a random passcode by sampling a list of adjectives and nouns

## Usage

``` r
random_passcode(adjective_noun_list = adjective_noun$norsk)
```

## Arguments

- adjective_noun_list:

  A list with adjectives and nouns. See
  [adjective_noun](https://richardjtelford.github.io/register/reference/adjective_noun.md).

## Value

A length-one character vector.

## Details

Random adjective-noun combinations are used to generate user names or
repo names by github and reddit.
