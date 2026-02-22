# Get started

[r2typ](https://y-sunflower.github.io/r2typ/) is an R package designed
to generate **Typst markup**. You can use it as is, but it also works
well with [Quarto](https://quarto.org/).

## Installation

You can install it with:

``` r
# install.packages("pak")
pak::pkg_install("y-sunflower/r2typ")
```

## Quick start

``` r
library(r2typ)
```

All functions accept any kind of positional or named arguments:

``` r
heading(level = 2, "A title")
#> #heading(level: 2)[A title]
text(weight = 500, "Some text")
#> #text(weight: 500)[Some text]
```

However, in Typst, not all functions behave the same way regarding
positional and named arguments. For this reason,
[r2typ](https://y-sunflower.github.io/r2typ/) automatically adjusts the
behavior when necessary.

For example, the
[`list_()`](https://y-sunflower.github.io/r2typ/reference/typst-function.md)
function will put everything in a list format:

``` r
list_(tight = FALSE, "hey", "you", "!")
#> #list(tight: false, [hey], [you], [!])
```

> Note that the function is
> [`list_()`](https://y-sunflower.github.io/r2typ/reference/typst-function.md)
> and not [`list()`](https://rdrr.io/r/base/list.html) because
> [`list()`](https://rdrr.io/r/base/list.html) is a base R function.

The same applies to the
[`table_()`](https://y-sunflower.github.io/r2typ/reference/typst-function.md)
function:

``` r
table_("hey", "you", "!")
#> #table([hey], [you], [!])
```

## Typst units

Typst uses a unique approach for units, as they are not quoted.

[r2typ](https://y-sunflower.github.io/r2typ/) provides several utility
functions to make working with Typst units easy:

``` r
text(size = pt(20), "Ice cream")
#> #text(size: 20pt)[Ice cream]
```

This works with all Typst units:

``` r
image("image.png", width = percent(80))
#> #image(width: 80%, "image.png")
```

## Typst colors

Typst offers a large set of predefined colors such as `red` or `blue`.
[r2typ](https://y-sunflower.github.io/r2typ/) provides the same:

``` r
text(fill = green, "Green text")
#> #text(fill: green)[Green text]
```

All built-in Typst colors are available in
[r2typ](https://y-sunflower.github.io/r2typ/). You can find them
[here](https://y-sunflower.github.io/r2typ/reference/typst_colors.md).

You can also use the
[`rgb()`](https://y-sunflower.github.io/r2typ/reference/typst_colors.md)
function:

``` r
text(fill = rgb("#ffc300"), "Yellow-ish text")
#> #text(fill: rgb("#ffc300"))[Yellow-ish text]
```

## Typst alignment

Similarly to colors, Typst includes specific objects for alignment. They
work well in [r2typ](https://y-sunflower.github.io/r2typ/):

``` r
place(
  center,
  dy = pt(15),
  "hello"
)
#> #place(center, dy: 15pt)[hello]
```

You can combine them to mimic Typst syntax:

``` r
place(
  top + left,
  dy = pt(15),
  "hello"
)
#> #place(top + left, dy: 15pt)[hello]
```

You can even combine them with colors, which is often useful for
strokes:

``` r
line(stroke = pt(2) + blue)
#> #line(stroke: 2pt + blue)
```

## Convert R types to Typst types

[r2typ](https://y-sunflower.github.io/r2typ/) converts some R types into
Typst types:

- `NULL` becomes `none`

``` r
image("image.png", width = percent(80), alt = NULL)
#> #image(width: 80%, alt: none, "image.png")
```

- `TRUE`/`FALSE` become `true`/`false`

``` r
list_(tight = FALSE, "hey", "you")
#> #list(tight: false, [hey], [you])
```

- [`c()`](https://rdrr.io/r/base/c.html) vectors and unnamed
  [`list()`](https://rdrr.io/r/base/list.html) (such as `list("a", "b"`)
  become arrays:

``` r
text(`stylistic-set` = c(1, 2, 3), "10 years ago")
#> #text(stylistic-set: (1, 2, 3))[10 years ago]

text(`stylistic-set` = list(1, 2, 3), "10 years ago") # equivalent
#> #text(stylistic-set: (1, 2, 3))[10 years ago]
```

- Named [`list()`](https://rdrr.io/r/base/list.html) (such as
  `list(a = "hello", b = "world")`) become dictionnaries:

``` r
text(costs = list(hyphenation = percent(100), runt = percent(100)))
#> #text(costs: (hyphenation: 100%, runt: 100%))
```

> Note that the goal here is **only** to translate R data types that
> have an equivalent in Typst, **not to be exhaustive**.

## Set and show rules

[r2typ](https://y-sunflower.github.io/r2typ/) has all a function for all
set and (simple) show rules. If you’re unfamiliar with them, check out
the [official documentation](https://typst.app/docs/reference/styling/).

### set rules

``` r
set_text(red)
#> #set text(red)

set_enum(tight = FALSE)
#> #set enum(tight: false)

set_par(
  `first-line-indent` = em(1),
  spacing = em(0.65),
  justify = TRUE
)
#> #set par(first-line-indent: 1em, spacing: 0.65em, justify: true)
```

### show rules

``` r
show_heading(set_text(navy))
#> #show heading: set text(navy)
```

## Nested function calls

Calling a function within another function works as well:

``` r
place(
  center + horizon,
  dy = pt(15),
  square(size = pt(35), fill = red)
)
#> #place(center + horizon, dy: 15pt)[#square(size: 35pt, fill: red)]

page(
  flipped = TRUE,
  columns = 2,
  fill = red,
  place(
    top + left,
    dx = pt(-5),
    rect(
      fill = blue,
      radius = pt(2),
      "yooooo"
    )
  )
)
#> #page(flipped: true, columns: 2, fill: red, [#place(top + left, dx: -5pt)[#rect(fill: blue, radius: 2pt)[yooooo]]])
```
