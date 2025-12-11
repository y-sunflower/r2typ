# Use user-defined functions

[r2typ](https://y-sunflower.github.io/r2typ/) provides pretty much all
Typst function, but one might want to be able to generate Typst markup
for its own custom functions.

This is possible AND very simple. For example, let’s say we defined a
“hello” Typst function, we can “register” it to
[r2typ](https://y-sunflower.github.io/r2typ/) by using
[`typst_function()`](https://y-sunflower.github.io/r2typ/reference/typst-function.md)

``` r
library(r2typ)

# register the "hello" function
hello <- function(...) typst_function("hello", ...)
```

``` r
hello(fill = red, size = pt(10), other_arg = "world")
#> #hello(fill: red, size: 10pt, other_arg: "world")
```
