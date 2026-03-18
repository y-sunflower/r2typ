# Compile a `.typ` file to a `.pdf` file and return the output path

Compile a `.typ` file to a `.pdf` file and return the output path.

## Usage

``` r
typst_compile(file, ...)
```

## Arguments

- file:

  Path to an existing `.typ` file.

- ...:

  Additional arguments passed to
  [`tynding::typst_compile()`](https://rdrr.io/pkg/tynding/man/typst_compile.html)

## Value

The path to the compiled PDF file.
