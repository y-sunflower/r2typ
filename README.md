# rtyp: An R package to generate Typst code

With `{rtyp}`, you can generate Typst code dynamically. It has support for:

- All most basic Typst functions
- set and show rules
- and has super simple syntax

<br>

## Quick start

```r
library("rtyp")

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
