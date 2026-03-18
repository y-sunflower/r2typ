# Write a Typst file from a character vector

Create a Typst file (.typ) from a character vector.

## Usage

``` r
typst_write(x, ...)
```

## Arguments

- x:

  A character vector representing Typst code.

- ...:

  Additional arguments passed to
  [`tynding::typst_write()`](https://rdrr.io/pkg/tynding/man/typst_write.html)

## Value

The path to the written .typ file, invisibly.

## Examples

``` r
if (FALSE) { # \dontrun{
code <- c("= Hello World", "This is a Typst document.")
typst_write(code, output = "hello.typ")
} # }
```
