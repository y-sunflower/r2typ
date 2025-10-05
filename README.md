# rtyp: an R package for generating Typst code

With `{rtyp}`, you can generate Typst code dynamically. It supports:

- all the most basic Typst functions
- `set` and `show` rules
- has an **extremely simple syntax**
- has no dependencies

<br>

## Quick start

```r
library(rtyp)

heading(level = 2, numbering = "1.1", "Hello world")
> "#heading(level: 2, numbering: \"1.1\")[Hello world]"

text(font = "Libertinus Serif", "I love cookies")
> "#text(font: \"Libertinus Serif\")[Hello world]"
```

<br>

## Installation

```r
remotes::install_github("y-sunflower/rtyp")
```

<br>

## Writing and compiling

If you want to write and compile your typst files, check out the [`{typr}` package](https://github.com/christopherkenny/typr/).
