# Typst Direction

These functions generate special objects representing directions in
Typst. They can be used as arguments in functions like
[`stack()`](https://y-sunflower.github.io/r2typ/reference/typst-function.md).

## Usage

``` r
ltr

rtl

ttb

btt
```

## Format

An object of class `typst_direction` (inherits from `typst_expression`)
of length 1.

An object of class `typst_direction` (inherits from `typst_expression`)
of length 1.

An object of class `typst_direction` (inherits from `typst_expression`)
of length 1.

An object of class `typst_direction` (inherits from `typst_expression`)
of length 1.

## Value

An object of class `typst_direction` and `typst_expression`.

## Examples

``` r
ltr
#> [1] "ltr"
#> attr(,"class")
#> [1] "typst_direction"  "typst_expression"
rtl
#> [1] "rtl"
#> attr(,"class")
#> [1] "typst_direction"  "typst_expression"
ttb
#> [1] "ttb"
#> attr(,"class")
#> [1] "typst_direction"  "typst_expression"
btt
#> [1] "btt"
#> attr(,"class")
#> [1] "typst_direction"  "typst_expression"
```
