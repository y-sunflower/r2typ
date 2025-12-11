# Typst validation

[r2typ](https://y-sunflower.github.io/r2typ/) does not do any kind
validation and will accept any arguments you’re passing to it.

For example, in Typst the `#linebreak()` function only accepts a
`justify: bool` argument, but in
[r2typ](https://y-sunflower.github.io/r2typ/) you can do:

``` r
library(r2typ)

linebreak()
```

``` r
linebreak(justify = TRUE)
```

``` r
linebreak(any_other_args = TRUE) # this works!
```

It’s considered to be the job of the user to make sure the arguments
they use make sense. The main reason for this is to reduce (a lot)
maintenance cost and make [r2typ](https://y-sunflower.github.io/r2typ/)
more easily up to date with new Typst versions in the future.

If you want to make sure that your Typst is valid, you can use the
[`is_valid_typst()`](https://y-sunflower.github.io/r2typ/reference/is_valid_typst.md)
function:

``` r
library(r2typ)

linebreak() |> is_valid_typst()
#> [1] TRUE
linebreak(justify = TRUE) |> is_valid_typst()
#> [1] TRUE
linebreak(any_other_args = TRUE) |> is_valid_typst()
#> [1] FALSE
```
