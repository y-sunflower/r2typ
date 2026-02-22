# r2typ (R to Typst): An R package for generating Typst markup

[r2typ](https://y-sunflower.github.io/r2typ/) allows you to generate
Typst markup using R and makes you much more efficient in creating PDF
reports. Think of it as
[htmltools](https://github.com/rstudio/htmltools), but for Typst! It
supports all of the following:

- ✅ almost **all** Typst functions (+ an option to add yours)
- ✅ **conversions** from R to Typst (`NULL` -\> `none`, `TRUE` -\>
  `true`, etc.)
- ✅ Typst **colors**, **alignment**, **units** and **direction**
  natively
- ✅ `set` and (simple) `show` rules
- ✅ works well with **Quarto**
- ✅ extremely **simple syntax**

[r2typ](https://y-sunflower.github.io/r2typ/) also provides **native**
Typst compilation, from R, without having to install Typst!

Check out the [documentation](https://y-sunflower.github.io/r2typ/).

  

## Installation

``` r
# install.packages("pak")
pak::pkg_install("y-sunflower/r2typ")
```

> \[!IMPORTANT\] The installation might take a few minutes because it
> needs build from source, including the Rust backend which requires
> compilation.

  

## Motivation

Typst is a powerful typesetting system, but writing its markup
programmatically from R can be cumbersome when you need to automate
reports, generate dynamic documents, or integrate Typst output into data
workflows. [r2typ](https://y-sunflower.github.io/r2typ/) fills this gap
by offering a light, consistent interface that turns R expressions
directly into valid Typst markup.

It streamlines the creation of complex layouts, ensures reliable type
conversions, and makes it easy to embed Typst generation into pipelines,
scripts, and Quarto projects.

  

## Quick start

The main thing to understand is that
[r2typ](https://y-sunflower.github.io/r2typ/) essentially does one
thing: generate text. And that’s it!

#### Basic usage

``` r
library(r2typ)

heading(level = 2, numbering = "1.1", "Hello world")
#> #heading(level: 2, numbering: "1.1")[Hello world]

text(size = pt(12), baseline = em(1.2), overhang = FALSE, "hey there")
#> #text(size: 12pt, baseline: 1.2em, overhang: false)[hey there]

image(width = percent(80), height = auto, "link.svg")
#> #image(width: 80%, height: auto, "link.svg")

circle(fill = blue, "hey")
#> #circle(fill: blue)[hey]

circle(radius = pt(100), "hey", linebreak(), "there")
#> #circle(radius: 100pt)[hey #linebreak() there]

place(top + left, dy = pt(15), square(size = pt(35), fill = red))
#> #place(top + left, dy: 15pt)[#square(size: 35pt, fill: red)]
```

#### Types conversion

[r2typ](https://y-sunflower.github.io/r2typ/) converts some R types into
Typst types:

- `NULL` becomes `none`

``` r
image("image.png", width = percent(80), alt = NULL)
#> #image(width: 80%, alt: none, \"image.png\")
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

#### Set and show rules

``` r
set_text(red, size = pt(20))
#> #set text(size: 20pt, red)

show_heading(set_text(fill = red))
#> #show heading: set text(fill: red, size: 20pt)
```

#### Validating Typst

Functions in [r2typ](https://y-sunflower.github.io/r2typ/) accept **all
positional and named arguments**! This means that you’re responsible of
making sure the arguments you’re using are valid!

But to help you in that process, there is a
[`is_valid_typst()`](https://y-sunflower.github.io/r2typ/reference/is_valid_typst.md)
function that will return either `TRUE` or `FALSE` depending on whether
your Typst can be compiled successfully.

``` r
place(
  top + left,
  dy = pt(15),
  square(size = pt(35), fill = red)
) |>
  is_valid_typst()
#> TRUE
```

> Also note that **all examples** in the
> [r2typ](https://y-sunflower.github.io/r2typ/) documentation are valid
> Typst examples.

#### Create Typst variables

You can use the
[`let()`](https://y-sunflower.github.io/r2typ/reference/let.md) function
to define Typst variables, and easily reuse them:

``` r
let("yellow", rgb("#FFC300"))
#> #let yellow = rgb("#FFC300")

let("mycirc", circle(fill = yellow, square(height = cm(1))))
#> #let mycirc = circle(fill: yellow)[#square(height: 1cm)]
```

#### Use your own Typst functions

``` r
hello <- function(...) typst_function("hello", ...)

hello(fill = red, size = pt(10), other_arg = "world")
#> #hello(fill: red, size: 10pt, other_arg: "world")
```

#### Complete example

A complete example that generates a PDF using R only:

``` r
c(
  set_page(height = pt(400)),
  set_text(purple),
  set_circle(width = percent(50)),
  align(
    center + horizon,
    circle(
      fill = aqua,
      stroke = pt(5) + red,
      align(
        right,
        text(
          font = "Roboto",
          size = em(1.2),
          "My favorite food is cookies!"
        )
      )
    )
  )
) |>
  typst_write() |>
  typst_compile(output = "example.pdf")
```

![](./articles/example.png)

Learn more in the [get started
vignette](https://y-sunflower.github.io/r2typ/articles/r2typ.html).

  

## Markup VS Code mode in Typst

[r2typ](https://y-sunflower.github.io/r2typ/) generates Typst
**markup**, not Typst **code**. Most people, when writing native Typst,
rely primarily on **markup** mode. **Code** mode is mainly used to add
logic or create functions.

This is an important distinction to keep in mind, but the core
difference is that function calls start with a `#` (e.g., `#text("hey")`
VS `text("hey")`).

You can learn more about it
[here](https://typst.app/docs/reference/syntax/).

  

## Missing functions

- ✅ Text
- ✅ Foundations
- ✅ Model, everything except: `cite`, `link`, `numbering`, `ref`,
  `terms`
- ✅ Layout, everything except: `columns`, `layout`, `measure`,
  `repeat`, `rotate`
- ✅ Visualize, everything except: `curve`, `gradient`, `path`,
  `stroke`, `polygon`, `tiling`

> something’s missing? Please [open an
> issue](https://github.com/y-sunflower/r2typ/issues)!
