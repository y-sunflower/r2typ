# Typst Color

These functions generate special objects representing colors in Typst
code. They can be used as arguments in functions like
[`text_()`](https://y-sunflower.github.io/r2typ/reference/typst-function.md)
or
[`heading()`](https://y-sunflower.github.io/r2typ/reference/typst-function.md)
to produce properly formatted Typst code.

## Usage

``` r
rgb_(hex)

silver

grey

black

white

navy

blue

aqua

teal

eastern

purple

fuchsia

maroon

red

orange

yellow

olive

green

lime
```

## Format

An object of class `typst_color` (inherits from `typst_expression`) of
length 1.

An object of class `typst_color` (inherits from `typst_expression`) of
length 1.

An object of class `typst_color` (inherits from `typst_expression`) of
length 1.

An object of class `typst_color` (inherits from `typst_expression`) of
length 1.

An object of class `typst_color` (inherits from `typst_expression`) of
length 1.

An object of class `typst_color` (inherits from `typst_expression`) of
length 1.

An object of class `typst_color` (inherits from `typst_expression`) of
length 1.

An object of class `typst_color` (inherits from `typst_expression`) of
length 1.

An object of class `typst_color` (inherits from `typst_expression`) of
length 1.

An object of class `typst_color` (inherits from `typst_expression`) of
length 1.

An object of class `typst_color` (inherits from `typst_expression`) of
length 1.

An object of class `typst_color` (inherits from `typst_expression`) of
length 1.

An object of class `typst_color` (inherits from `typst_expression`) of
length 1.

An object of class `typst_color` (inherits from `typst_expression`) of
length 1.

An object of class `typst_color` (inherits from `typst_expression`) of
length 1.

An object of class `typst_color` (inherits from `typst_expression`) of
length 1.

An object of class `typst_color` (inherits from `typst_expression`) of
length 1.

An object of class `typst_color` (inherits from `typst_expression`) of
length 1.

## Arguments

- hex:

  An hexadecimal color.

## Value

An object of class `typst_color` and `typst_expression`.

## Examples

``` r
rgb_("#ffffff")
#> [1] "rgb(\"#ffffff\")"
#> attr(,"class")
#> [1] "typst_color"      "typst_expression"
text_(font = "Roboto", fill = rgb_("#ffffff"), "cookies are healthy!!")
#> [1] "#text(font: \"Roboto\", fill: rgb(\"#ffffff\"))[cookies are healthy!!]"
#> attr(,"class")
#> [1] "typst_markup"
red
#> [1] "red"
#> attr(,"class")
#> [1] "typst_color"      "typst_expression"
blue
#> [1] "blue"
#> attr(,"class")
#> [1] "typst_color"      "typst_expression"
black
#> [1] "black"
#> attr(,"class")
#> [1] "typst_color"      "typst_expression"
```
