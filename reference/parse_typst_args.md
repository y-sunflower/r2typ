# Parse `...` arguments

This functions parses user arguments from `...`. The goal is to get
which arguments are named or not, convert to their Typst format and
return a list with parsed info.

## Usage

``` r
parse_typst_args(name, ...)
```

## Arguments

- name:

  Name of the function

- ...:

  Any kind of named or not arguments.

## Value

A list with function name, named args and unnamed args:
`list(name = name, named_str = named_str, unnamed_str = unnamed_str, expression_str = expression_str)`.
