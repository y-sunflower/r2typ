# r2typ (R to Typst): An R package for generating Typst markup

`{r2typ}` lets you generate Typst markup using R functions. It supports all of the following:

- ✅ almost **all** Typst functions
- ✅ **conversions** from R to Typst (`NULL` -> `none`, `TRUE` -> `true`, etc.)
- ✅ Typst **colors**, **alignment**, **units** and **direction** natively
- ✅ `set` and (simple) `show` rules
- ✅ works well with **Quarto**
- ✅ extremely **simple syntax**
- ✅ and **zero** dependencies

Check out the [documentation](https://y-sunflower.github.io/r2typ/).

> [!WARNING]  
> The project is still early stage and contains a few bugs.

<br>

## Installation

```r
# install.packages("pak")
pak::pkg_install("y-sunflower/r2typ")
```

<br>

## Quick start

#### Basic usage

```r
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

#### Validating Typst

Functions in `{r2typ}` accept **all positional and named arguments**! This means that you're responsible of making sure the arguments you're using are valid!

But to help you in that process, there is a `is_valid_typst()` function that will return either `TRUE` or `FALSE` depending on whether your Typst can be compiled successfully.

```r
place(
  top + left,
  dy = pt(15),
  square(size = pt(35), fill = red)
) |>
  is_valid_typst()
#> TRUE
```

> Also note that **all examples** in the `{r2typ}` documentation are valid Typst examples.

#### Types conversion

`{r2typ}` converts some R types into Typst types:

- `NULL` becomes `none`

```r
image("image.png", width = percent(80), alt = NULL)
#> #image(width: 80%, alt: none, \"image.png\")
```

- `TRUE`/`FALSE` become `true`/`false`

```r
list_(tight = FALSE, "hey", "you")
#> #list(tight: false, [hey], [you])
```

- `c()` vectors and unnamed `list()` (such as `list("a", "b"`) become arrays:

```r
text(`stylistic-set` = c(1, 2, 3), "10 years ago")
#> #text(stylistic-set: (1, 2, 3))[10 years ago]

text(`stylistic-set` = list(1, 2, 3), "10 years ago") # equivalent
#> #text(stylistic-set: (1, 2, 3))[10 years ago]
```

- Named `list()` (such as `list(a = "hello", b = "world")`) become dictionnaries:

```r
text(costs = list(hyphenation = percent(100), runt = percent(100)))
#> #text(costs: (hyphenation: 100%, runt: 100%))
```

#### Set and show rules

```r
set_text(red, size = pt(20))
#> #set text(size: 20pt, red)

show_("heading", set_text(red, size = pt(20)))
#> #show heading: set text(size: 20pt, red)
```

#### Complete example

A complete example that generates a PDF using R only:

```r
c(
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
  typst_compile(output = "here.pdf")
```

Learn more in the [get started vignette](https://y-sunflower.github.io/r2typ/articles/r2typ.html).

<br>

## Markup VS Code mode in Typst

`{r2typ}` generates Typst **markup**, not Typst **code**. Most people, when writing native Typst, rely primarily on **markup** mode. **Code** mode is mainly used to add logic or create functions.

This is an important distinction to keep in mind, but the core difference is that function calls start with a `#` (e.g., `#text("hey")` VS `text("hey")`).

You can learn more about it [here](https://typst.app/docs/reference/syntax/).

<br>

## Missing functions

- ✅ Text
- ✅ Foundations
- ✅ Model, everything except: `cite`, `link`, `numbering`, `ref`, `terms`
- ✅ Layout, everything except: `columns`, `layout`, `measure`, `repeat`, `rotate`
- ✅ Visualize, everything except: `curve`, `gradient`, `path`, `stroke`, `polygon`, `tiling`

> something's missing? Please [open an issue](https://github.com/y-sunflower/r2typ/issues)!
