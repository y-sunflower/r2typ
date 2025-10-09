# rtyp: an R package designed to generate markup Typst code

With `{rtyp}`, you can dynamically generate Typst code. It supports:

- all the most basic Typst functions
- `set` rules
- conversions from R types to Typst (`NULL` -> `none`, `TRUE` -> `true`, etc.)
- Typst **units** with helper functions
- Typst **colors** natively
- Typst **alignment** natively
- an extremely **simple syntax**
- and **zero** dependencies

Check out the [documentation](https://y-sunflower.github.io/rtyp/).

> [!WARNING]  
> **Not functional yet**

<br>

## Quick start

```r
library(rtyp)

heading(level = 2, numbering = "1.1", "Hello world")
> #heading(level: 2, numbering: "1.1")[Hello world]

text(size = pt(12), baseline = em(1.2), overhang = FALSE, "hey there")
> #text(size: 12pt, baseline: 1.2em, overhang: false)[hey there]

image(width = percent(80), height = "auto", "link.svg")
> #image(width: 80%, height: auto, "link.svg")

circle(fill = blue, "hey")
> #circle(fill: blue)[hey]

circle(radius = pt(100), "hey", linebreak(), "there")
> #circle(radius: 100pt)[hey #linebreak() there]

place(top + left, dy = pt(15), square(size = pt(35), fill = red))
> #place(top + left, dy: 15pt)[#square(size: 35pt, fill: red)]
```

<br>

## Installation

```r
remotes::install_github("y-sunflower/rtyp")
```

<br>

## Writing and compiling

If you want to write and compile your typst files from R, check out the [`{typr}` package](https://github.com/christopherkenny/typr/).

<br>

## TODO

- ✅ Text
- ✅ Model
  - ❌ `cite`: https://typst.app/docs/reference/model/cite/
  - ❌ `link`: https://typst.app/docs/reference/model/link/
  - ❌ `numbering`: https://typst.app/docs/reference/model/numbering/
  - ❌ `ref`: https://typst.app/docs/reference/model/ref/
  - ❌ `terms`: https://typst.app/docs/reference/model/terms/
- ✅ Visualize
  - ❌ `curve`: https://typst.app/docs/reference/visualize/curve/
  - ❌ `gradient`: https://typst.app/docs/reference/visualize/gradient/
  - ❌ `path`: https://typst.app/docs/reference/visualize/path/
  - ❌ `stroke`: https://typst.app/docs/reference/visualize/stroke/
  - ❌ `polygon`: https://typst.app/docs/reference/visualize/polygon/
  - ❌ `tiling`: https://typst.app/docs/reference/visualize/tiling/
- ❌ Foundations
- ❌ Math
- ❌ Layout
