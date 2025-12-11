# Typst Alignment

These functions generate special objects representing alignment in Typst
code. They can be used as arguments in functions like
[`text()`](https://y-sunflower.github.io/r2typ/reference/typst-function.md)
or
[`heading()`](https://y-sunflower.github.io/r2typ/reference/typst-function.md)
to produce properly formatted Typst code.

## Usage

``` r
# S3 method for class 'typst_alignment'
left_align + right_align

horizon

top

bottom

center

left

right
```

## Format

An object of class `typst_alignment` (inherits from `typst_expression`)
of length 1.

An object of class `typst_alignment` (inherits from `typst_expression`)
of length 1.

An object of class `typst_alignment` (inherits from `typst_expression`)
of length 1.

An object of class `typst_alignment` (inherits from `typst_expression`)
of length 1.

An object of class `typst_alignment` (inherits from `typst_expression`)
of length 1.

An object of class `typst_alignment` (inherits from `typst_expression`)
of length 1.

## Arguments

- left_align:

  A typst alignment

- right_align:

  A typst alignment

## Value

An object of class `typst_alignment`.

## Examples

``` r
left
#> [1] "left"
#> attr(,"class")
#> [1] "typst_alignment"  "typst_expression"
center + horizon
#> [1] "center + horizon"
#> attr(,"class")
#> [1] "typst_alignment"  "typst_expression"
top + right
#> [1] "top + right"
#> attr(,"class")
#> [1] "typst_alignment"  "typst_expression"
```
