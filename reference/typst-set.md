# Typst set rules

Generates Typst set rules for a given function.

## Usage

``` r
set_place(...)

set_align(...)

set_h(...)

set_v(...)

set_block(...)

set_box(...)

set_colbreak(...)

set_stack(...)

set_grid(...)

set_hide(...)

set_pagebreak(...)

set_move(...)

set_pad(...)

set_page(...)

set_scale(...)

set_skew(...)

set_rotate(...)

set_bibliography(...)

set_document(...)

set_emph(...)

set_figure(...)

set_footnote(...)

set_heading(...)

set_enum(...)

set_outline(...)

set_par(...)

set_parbreak(...)

set_quote(...)

set_strong(...)

set_table(...)

set_text(...)

set_linebreak(...)

set_overline(...)

set_smallcaps(...)

set_smartquote(...)

set_strike(...)

set_sub(...)

set_super(...)

set_underline(...)

set_upper(...)

set_raw(...)

set_highlight(...)

set_lower(...)

set_image(...)

set_circle(...)

set_ellipse(...)

set_line(...)

set_rect(...)

set_square(...)
```

## Arguments

- ...:

  Named or unnamed arguments passed to the Typst function. Named
  arguments become Typst parameters (e.g. `level = 2` → `level: 2`),
  while unnamed arguments form the body inside `[...]`.

## Value

A character string containing the generated Typst code.

## Examples

``` r
set_place(dx = pt(50))
#> [1] "#set place(dx: 50pt)"
#> attr(,"class")
#> [1] "typst_markup"
set_h(weak = TRUE)
#> [1] "#set h(weak: true)"
#> attr(,"class")
#> [1] "typst_markup"
set_v(weak = TRUE)
#> [1] "#set v(weak: true)"
#> attr(,"class")
#> [1] "typst_markup"
set_block(breakable = FALSE, width = percent(50), height = auto, fill = aqua)
#> [1] "#set block(breakable: false, width: 50%, height: auto, fill: aqua)"
#> attr(,"class")
#> [1] "typst_markup"
set_box(clip = FALSE, width = percent(50), height = auto, fill = red)
#> [1] "#set box(clip: false, width: 50%, height: auto, fill: red)"
#> attr(,"class")
#> [1] "typst_markup"
set_colbreak(weak = TRUE)
#> [1] "#set colbreak(weak: true)"
#> attr(,"class")
#> [1] "typst_markup"
set_stack(dir = ttb)
#> [1] "#set stack(dir: ttb)"
#> attr(,"class")
#> [1] "typst_markup"
set_grid(columns = 2, rows = 2, gutter = pt(3))
#> [1] "#set grid(columns: 2, rows: 2, gutter: 3pt)"
#> attr(,"class")
#> [1] "typst_markup"
set_pagebreak(weak = TRUE)
#> [1] "#set pagebreak(weak: true)"
#> attr(,"class")
#> [1] "typst_markup"
set_move(dx = pt(3), dy = pt(5))
#> [1] "#set move(dx: 3pt, dy: 5pt)"
#> attr(,"class")
#> [1] "typst_markup"
set_pad(x = percent(0) + pt(5), y = percent(10) + pt(0))
#> [1] "#set pad(x: 0% + 5pt, y: 10% + 0pt)"
#> attr(,"class")
#> [1] "typst_markup"
set_page(
 flipped = TRUE,
 columns = 2,
 fill = red
)
#> [1] "#set page(flipped: true, columns: 2, fill: red)"
#> attr(,"class")
#> [1] "typst_markup"
set_scale(x = percent(-100))
#> [1] "#set scale(x: -100%)"
#> attr(,"class")
#> [1] "typst_markup"
set_skew(ax = deg(-12))
#> [1] "#set skew(ax: -12deg)"
#> attr(,"class")
#> [1] "typst_markup"
set_rotate(deg(-12))
#> [1] "#set rotate(-12deg)"
#> attr(,"class")
#> [1] "typst_markup"
set_bibliography(full = TRUE)
#> [1] "#set bibliography(full: true)"
#> attr(,"class")
#> [1] "typst_markup"
set_document(author = "Me, myself & I")
#> [1] "#set document(author: \"Me, myself & I\")"
#> attr(,"class")
#> [1] "typst_markup"
set_emph()
#> [1] "#set emph()"
#> attr(,"class")
#> [1] "typst_markup"
set_figure(alt = "This is an alternative text")
#> [1] "#set figure(alt: \"This is an alternative text\")"
#> attr(,"class")
#> [1] "typst_markup"
set_footnote(numbering = "*")
#> [1] "#set footnote(numbering: \"*\")"
#> attr(,"class")
#> [1] "typst_markup"
set_heading(level = 3)
#> [1] "#set heading(level: 3)"
#> attr(,"class")
#> [1] "typst_markup"
set_enum(tight = FALSE)
#> [1] "#set enum(tight: false)"
#> attr(,"class")
#> [1] "typst_markup"
set_outline(depth = 1)
#> [1] "#set outline(depth: 1)"
#> attr(,"class")
#> [1] "typst_markup"
set_par(
 `first-line-indent` = em(1),
 spacing = em(0.65),
 justify = TRUE
)
#> [1] "#set par(first-line-indent: 1em, spacing: 0.65em, justify: true)"
#> attr(,"class")
#> [1] "typst_markup"
set_quote(block = TRUE)
#> [1] "#set quote(block: true)"
#> attr(,"class")
#> [1] "typst_markup"
set_strong(delta = 400)
#> [1] "#set strong(delta: 400)"
#> attr(,"class")
#> [1] "typst_markup"
set_table(align = center, inset = pt(10))
#> [1] "#set table(align: center, inset: 10pt)"
#> attr(,"class")
#> [1] "typst_markup"
set_text(fill = silver, size = pt(20))
#> [1] "#set text(fill: silver, size: 20pt)"
#> attr(,"class")
#> [1] "typst_markup"
set_linebreak(justify = TRUE)
#> [1] "#set linebreak(justify: true)"
#> attr(,"class")
#> [1] "typst_markup"
set_overline(evade = FALSE)
#> [1] "#set overline(evade: false)"
#> attr(,"class")
#> [1] "typst_markup"
set_smallcaps(all = TRUE)
#> [1] "#set smallcaps(all: true)"
#> attr(,"class")
#> [1] "typst_markup"
set_smartquote(double = FALSE)
#> [1] "#set smartquote(double: false)"
#> attr(,"class")
#> [1] "typst_markup"
set_strike(offset = em(2))
#> [1] "#set strike(offset: 2em)"
#> attr(,"class")
#> [1] "typst_markup"
set_sub(typographic = FALSE)
#> [1] "#set sub(typographic: false)"
#> attr(,"class")
#> [1] "typst_markup"
set_super(typographic = FALSE)
#> [1] "#set super(typographic: false)"
#> attr(,"class")
#> [1] "typst_markup"
set_underline(stroke = pt(3) + olive)
#> [1] "#set underline(stroke: 3pt + olive)"
#> attr(,"class")
#> [1] "typst_markup"
set_raw(lang = "python", block = TRUE)
#> [1] "#set raw(lang: \"python\", block: true)"
#> attr(,"class")
#> [1] "typst_markup"
set_highlight(extent = pt(3))
#> [1] "#set highlight(extent: 3pt)"
#> attr(,"class")
#> [1] "typst_markup"
image(width = percent(80), height = auto)
#> [1] "#image(width: 80%, height: auto)"
#> attr(,"class")
#> [1] "typst_markup"
set_circle(fill = blue)
#> [1] "#set circle(fill: blue)"
#> attr(,"class")
#> [1] "typst_markup"
set_ellipse(fill = green)
#> [1] "#set ellipse(fill: green)"
#> attr(,"class")
#> [1] "typst_markup"
set_line(length = percent(80), angle = deg(20))
#> [1] "#set line(length: 80%, angle: 20deg)"
#> attr(,"class")
#> [1] "typst_markup"
set_rect(fill = aqua, radius = pt(3))
#> [1] "#set rect(fill: aqua, radius: 3pt)"
#> attr(,"class")
#> [1] "typst_markup"
set_square(size = pt(5), fill = olive)
#> [1] "#set square(size: 5pt, fill: olive)"
#> attr(,"class")
#> [1] "typst_markup"
```
