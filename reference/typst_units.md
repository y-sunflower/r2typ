# Typst Unit Values

These functions generate special objects representing units in Typst
code. They can be used as arguments in functions like
[`text()`](https://y-sunflower.github.io/r2typ/reference/typst-function.md)
or
[`heading()`](https://y-sunflower.github.io/r2typ/reference/typst-function.md)
to produce properly formatted Typst code.

## Usage

``` r
pt(x)

mm(x)

cm(x)

em(x)

percent(x)

fr(x)

deg(x)

rad(x)
```

## Arguments

- x:

  Numeric value of the unit.

## Value

An object of class `typst_unit` with an associated unit attribute. When
passed to a Typst-generating function, it is converted to the
appropriate unit string (e.g., `12pt`, `1.5em`, `80%`).

## Examples

``` r
pt(12)       # Represents 12pt
#> [1] "12"
#> attr(,"class")
#> [1] "typst_unit"       "typst_expression"
#> attr(,"unit")
#> [1] "pt"
em(1.5)      # Represents 1.5em
#> [1] "1.5"
#> attr(,"class")
#> [1] "typst_unit"       "typst_expression"
#> attr(,"unit")
#> [1] "em"
percent(80)  # Represents 80%
#> [1] "80"
#> attr(,"class")
#> [1] "typst_unit"       "typst_expression"
#> attr(,"unit")
#> [1] "%"
fr(2)        # Represents 2fr
#> [1] "2"
#> attr(,"class")
#> [1] "typst_unit"       "typst_expression"
#> attr(,"unit")
#> [1] "fr"
rad(3.14)    # Represents 3.14rad
#> [1] "3.14"
#> attr(,"class")
#> [1] "typst_unit"       "typst_expression"
#> attr(,"unit")
#> [1] "rad"

text(size = pt(12), "Hello world")
#> [1] "#text(size: 12pt)[Hello world]"
#> attr(,"class")
#> [1] "typst_markup"
```
