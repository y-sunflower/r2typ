<br>

> [!WARNING]  
> **Not functional yet**

<br>
<br>
<br>
<br>

# rtyp: an R package for generating Typst code

With `{rtyp}`, you can dynamically generate Typst code. It supports:

- all the most basic Typst functions
- `set` rules
- conversions from R types to Typst (`TRUE` -> `true`, `NULL` -> `none`, etc.)
- Typst units with helper functions
- an extremely **simple syntax**
- **no** dependencies

Check out the [documentation](https://y-sunflower.github.io/rtyp/).

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
- ❌ Foundations
- ❌ Model
- ❌ Math
- ❌ Symbols
- ❌ Layout
- ❌ Visualize
