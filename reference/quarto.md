# Raw blocks for Quarto and Custom knit_print

Convert to raw Typst for Quarto. Using this function is required to
include the output of `{r2typ}` in your document.

Define output behavior when "knit printing" a `typst_markup` object with
`knitr` (mostly with Quarto).

Learn more in the [Quarto usage
vignette](https://y-sunflower.github.io/r2typ/articles/using-r2typ-in-quarto-documents.md).

## Usage

``` r
as_quarto_typst(x)

# S3 method for class 'typst_markup'
knit_print(x, ...)
```

## Arguments

- x:

  A character vector to interpret as raw typst or an object of class
  `typst_markup`

- ...:

  Ignored

## Value

For `as_quarto_typst()`, a raw version wrapped in the expected Quarto
format. For `knit_print.typst_markup()`, output from
`as_quarto_typst()`.

## Examples

``` r
heading(level = 2, numbering = "1.1", "Hello world") |> as_quarto_typst()
#> [1] "\n```{=typst}\n#heading(level: 2, numbering: \"1.1\")[Hello world]\n```\n"
#> attr(,"class")
#> [1] "knit_asis"
#> attr(,"knit_cacheable")
#> [1] NA

typ_markup <- heading(level = 2, numbering = "1.1", "Hello world")
as_quarto_typst(typ_markup)
#> [1] "\n```{=typst}\n#heading(level: 2, numbering: \"1.1\")[Hello world]\n```\n"
#> attr(,"class")
#> [1] "knit_asis"
#> attr(,"knit_cacheable")
#> [1] NA
```
