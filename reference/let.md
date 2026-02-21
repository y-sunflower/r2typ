# Typst let keyword

`let` is the keyword used to define variables in Typst. It allows to
create reusable components.

## Usage

``` r
let(name, value)
```

## Arguments

- name:

  Name of the variables.

- value:

  Value to assign to `name`.

## Value

A character string

## Examples

``` r
let("yellow", rgb("#FFC300"))
#> [1] "#let yellow = rgb(\"#FFC300\")"
#> attr(,"class")
#> [1] "typst_markup"

let("mycirc", circle(width=cm(3), fill=yellow, square(height=cm(1))))
#> [1] "#let mycirc = circle(width: 3cm, fill: yellow)[#square(height: 1cm)]"
#> attr(,"class")
#> [1] "typst_markup"
```
