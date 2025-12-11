# Compile a Typst file or character vector

Call the Typst CLI compiler and compile a file (.typ). Falls back to
`quarto typst` if `typst` is unavailable.

## Usage

``` r
typst_compile(file, output = NULL)
```

## Arguments

- file:

  Path to a file (must end with ".typ").

- output:

  Optional path for the output file (default NULL).

## Value

Output file path, invisibly.

## Note

It requires to have the Typst compiler installed. See
[typst.app/open-source/](https://typst.app/open-source/).
