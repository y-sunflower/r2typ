# Typst let keyword

`let` is the keyword used to define variables in Typst. It allows to
create reusable components.

Note that it will call `assign(name, value, envir = parent.frame())` so
that `name` becomes an actual variable in your R environment.

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
#> [1] "#let mycirc = circle(width: 3cm, fill: rgb(\"#FFC300\"))[#square(height: 1cm)]"
#> attr(,"class")
#> [1] "typst_markup"
```
