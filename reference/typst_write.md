# Write a Typst file from a character vector

Create a Typst file (.typ) from a character vector.

## Usage

``` r
typst_write(x, output = NULL)
```

## Arguments

- x:

  A character vector representing Typst code.

- output:

  Optional output file path (must end with ".typ"). If NULL, a temporary
  file is created.

## Value

The path to the written .typ file, invisibly.

## Examples

``` r
if (FALSE) { # \dontrun{
code <- c("= Hello World", "This is a Typst document.")
typst_write(code, output = "hello.typ")
} # }
```
