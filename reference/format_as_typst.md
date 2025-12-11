# Format into Typst format

Format `x` to its Typst equivalent. This function is used internally to
convert R data types to their equivalent in Typst. It works recursively.

## Usage

``` r
format_as_typst(x, named)
```

## Arguments

- x:

  The object to convert.

- named:

  Whether `x` is named or not.

## Value

Formatted to Typst

## Examples

``` r
format_as_typst(c(1, 2, 3))
#> [1] "(1, 2, 3)"
format_as_typst(list(1, 2, 3))
#> [1] "(1, 2, 3)"
format_as_typst(list(a=1, b=2, c=3))
#> [1] "(a: 1, b: 2, c: 3)"
format_as_typst(pt(20))
#> [1] "20pt"
format_as_typst(TRUE)
#> [1] "true"
format_as_typst(FALSE)
#> [1] "false"
format_as_typst(NULL)
#> [1] "none"
```
