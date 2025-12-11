# Create a Typst function

Used to create all Typst functions in `r2typ`. Arguments are parsed and
then translated to Typst.

Generates Typst code with element. Named arguments are included as Typst
keyword arguments (e.g. `level`, `numbering`), and unnamed arguments are
used as the heading content. But please note that this behavior might be
different in some functions to respect true Typst syntax (such as
`#table()` for instance).

## Usage

``` r
typst_function(name, ...)

assert(...)

bytes(...)

datetime(...)

duration(...)

eval_(...)

panic(...)

regex(...)

repr(...)

str_(...)

symbol(...)

decimal(...)

type(...)

version(...)

place(...)

align(...)

h(...)

v(...)

block(...)

box(...)

colbreak(...)

stack(...)

grid(...)

hide(...)

pagebreak(...)

move(...)

pad(...)

page(...)

scale_(...)

skew(...)

rotate(...)

bibliography(...)

set_list(...)

list_(...)

document(...)

emph(...)

figure(...)

footnote(...)

heading(...)

enum(...)

outline(...)

par(...)

parbreak(...)

quote_(...)

strong(...)

table_(...)

text(...)

linebreak(...)

overline(...)

smallcaps(...)

smartquote(...)

strike(...)

sub_(...)

super(...)

underline(...)

upper(...)

raw_(...)

highlight(...)

lower(...)

image(...)

circle(...)

ellipse(...)

line(...)

rect(...)

square(...)
```

## Arguments

- name:

  Function name

- ...:

  Named or unnamed arguments passed to the Typst function. Named
  arguments become Typst parameters (e.g. `level = 2` → `level: 2`),
  while unnamed arguments form the body inside `[...]`.

## Value

A character vector with well formatted Typst.

A character string containing the generated Typst code.

## Examples

``` r
assert(1 < 2, message = "math broke")
#> [1] "#assert(true, message: \"math broke\")"
#> attr(,"class")
#> [1] "typst_markup"
bytes("more cookies...")
#> [1] "#bytes(\"more cookies...\")"
#> attr(,"class")
#> [1] "typst_markup"
datetime(year = 2012, month = 8, day = 3)
#> [1] "#datetime(year: 2012, month: 8, day: 3)"
#> attr(,"class")
#> [1] "typst_markup"
duration(days = 3, hours = 12)
#> [1] "#duration(days: 3, hours: 12)"
#> attr(,"class")
#> [1] "typst_markup"
eval_("*Markup!*", mode = "markup")
#> [1] "#eval(mode: \"markup\", \"*Markup!*\")"
#> attr(,"class")
#> [1] "typst_markup"
panic("this is wrong")
#> [1] "#panic(\"this is wrong\")"
#> attr(,"class")
#> [1] "typst_markup"
regex("\\d+")
#> [1] "#regex(\"\\d+\")"
#> attr(,"class")
#> [1] "typst_markup"
repr("hello")
#> [1] "#repr(\"hello\")"
#> attr(,"class")
#> [1] "typst_markup"
str_("hello")
#> [1] "#str(\"hello\")"
#> attr(,"class")
#> [1] "typst_markup"
symbol("10")
#> [1] "#symbol(\"10\")"
#> attr(,"class")
#> [1] "typst_markup"
decimal("10")
#> [1] "#decimal(\"10\")"
#> attr(,"class")
#> [1] "typst_markup"
type("10")
#> [1] "#type(\"10\")"
#> attr(,"class")
#> [1] "typst_markup"
version(1, 2, 3, 4)
#> [1] "#version(1, 2, 3, 4)"
#> attr(,"class")
#> [1] "typst_markup"
version(c(1, 2, 3, 4))
#> [1] "#version((1, 2, 3, 4))"
#> attr(,"class")
#> [1] "typst_markup"
place(dx = pt(50), "pasta")
#> [1] "#place(dx: 50pt)[pasta]"
#> attr(,"class")
#> [1] "typst_markup"
align(center + horizon, "hey")
#> [1] "#align(center + horizon)[hey]"
#> attr(,"class")
#> [1] "typst_markup"
h(fr(3))
#> [1] "#h(3fr)"
#> attr(,"class")
#> [1] "typst_markup"
v(percent(3), weak = TRUE)
#> [1] "#v(3%, weak: true)"
#> attr(,"class")
#> [1] "typst_markup"
block(breakable = FALSE, width = percent(50), height = auto, fill = aqua, "cookies")
#> [1] "#block(breakable: false, width: 50%, height: auto, fill: aqua)[cookies]"
#> attr(,"class")
#> [1] "typst_markup"
box(clip = FALSE, width = percent(50), height = auto, fill = red, "ice cream")
#> [1] "#box(clip: false, width: 50%, height: auto, fill: red)[ice cream]"
#> attr(,"class")
#> [1] "typst_markup"
colbreak(weak = TRUE)
#> [1] "#colbreak(weak: true)"
#> attr(,"class")
#> [1] "typst_markup"
stack(dir = ttb, "hey", "you", "!")
#> [1] "#stack(dir: ttb, \"hey\", \"you\", \"!\")"
#> attr(,"class")
#> [1] "typst_markup"
grid(columns = 2, rows = 2, gutter = pt(3), "hey", "cookies", "ice", "cream")
#> [1] "#grid(columns: 2, rows: 2, gutter: 3pt, \"hey\", \"cookies\", \"ice\", \"cream\")"
#> attr(,"class")
#> [1] "typst_markup"
hide("this is hidden")
#> [1] "#hide()[this is hidden]"
#> attr(,"class")
#> [1] "typst_markup"
pagebreak("this is hidden")
#> [1] "#pagebreak(\"this is hidden\")"
#> attr(,"class")
#> [1] "typst_markup"
move(dx = pt(3), dy = pt(5), "pasta")
#> [1] "#move(dx: 3pt, dy: 5pt, \"pasta\")"
#> attr(,"class")
#> [1] "typst_markup"
pad(x = percent(0) + pt(5), y = percent(10) + pt(0), image("file.svg"))
#> [1] "#pad(x: 0% + 5pt, y: 10% + 0pt, [#image(\"file.svg\")])"
#> attr(,"class")
#> [1] "typst_markup"
page(
 flipped = TRUE,
 columns = 2,
 fill = red,
 place(
   top + left,
   dx = pt(-5),
   rect(fill = blue, radius = pt(2), "yooooo")
 )
)
#> [1] "#page(flipped: true, columns: 2, fill: red, [#place(top + left, dx: -5pt)[#rect(fill: blue, radius: 2pt)[yooooo]]])"
#> attr(,"class")
#> [1] "typst_markup"
scale_(x = percent(-100), "This is mirrored")
#> [1] "#scale(x: -100%)[This is mirrored]"
#> attr(,"class")
#> [1] "typst_markup"
skew(ax = deg(-12), "This is some fake italic text.")
#> [1] "#skew(ax: -12deg)[This is some fake italic text.]"
#> attr(,"class")
#> [1] "typst_markup"
rotate(deg(-12), "What a weird feature!")
#> [1] "#rotate(-12deg)[What a weird feature!]"
#> attr(,"class")
#> [1] "typst_markup"
bibliography(full = TRUE, "more cookies...")
#> [1] "#bibliography(full: true, \"more cookies...\")"
#> attr(,"class")
#> [1] "typst_markup"
set_list(tight = TRUE)
#> [1] "#set list(tight: true)"
#> attr(,"class")
#> [1] "typst_markup"
list_(tight = TRUE, "I", "need", "a cat")
#> [1] "#list(tight: true, [I], [need], [a cat])"
#> attr(,"class")
#> [1] "typst_markup"
emph("please! more cookies...")
#> [1] "#emph()[please! more cookies...]"
#> attr(,"class")
#> [1] "typst_markup"
figure(alt = "This is an alternative text", "more cookies...")
#> [1] "#figure(alt: \"This is an alternative text\", \"more cookies...\")"
#> attr(,"class")
#> [1] "typst_markup"
footnote(numbering = "*", "Cheese")
#> [1] "#footnote(numbering: \"*\")[Cheese]"
#> attr(,"class")
#> [1] "typst_markup"
heading(level = 3, "Intro", "More text")
#> [1] "#heading(level: 3)[Intro More text]"
#> attr(,"class")
#> [1] "typst_markup"
enum(tight = FALSE, "I wonder", "if", "people", "will", "see", "this text")
#> [1] "#enum(tight: false, [I wonder], [if], [people], [will], [see], [this text])"
#> attr(,"class")
#> [1] "typst_markup"
outline(depth = 1)
#> [1] "#outline(depth: 1)"
#> attr(,"class")
#> [1] "typst_markup"
par(
 `first-line-indent` = em(1),
 spacing = em(0.65),
 justify = TRUE,
 "more cookies..."
)
#> [1] "#par(first-line-indent: 1em, spacing: 0.65em, justify: true)[more cookies...]"
#> attr(,"class")
#> [1] "typst_markup"
parbreak()
#> [1] "#parbreak()"
#> attr(,"class")
#> [1] "typst_markup"
quote_(block = TRUE, "more cookies...")
#> [1] "#quote(block: true)[more cookies...]"
#> attr(,"class")
#> [1] "typst_markup"
strong("strong coffee")
#> [1] "#strong()[strong coffee]"
#> attr(,"class")
#> [1] "typst_markup"
table_(align = center, inset = pt(10), "a", "b", "c", "d")
#> [1] "#table(align: center, inset: 10pt, [a], [b], [c], [d])"
#> attr(,"class")
#> [1] "typst_markup"
text(fill = silver, size = pt(20), "The most basic function in Typst...")
#> [1] "#text(fill: silver, size: 20pt)[The most basic function in Typst...]"
#> attr(,"class")
#> [1] "typst_markup"
linebreak(justify = TRUE)
#> [1] "#linebreak(justify: true)"
#> attr(,"class")
#> [1] "typst_markup"
overline(evade = FALSE, "not sure who even uses this function")
#> [1] "#overline(evade: false)[not sure who even uses this function]"
#> attr(,"class")
#> [1] "typst_markup"
smallcaps(all = TRUE, "Niche but useful func")
#> [1] "#smallcaps(all: true)[Niche but useful func]"
#> attr(,"class")
#> [1] "typst_markup"
smartquote(double = FALSE)
#> [1] "#smartquote(double: false)"
#> attr(,"class")
#> [1] "typst_markup"
strike(offset = em(2), "strike function is kind of cool tbh!")
#> [1] "#strike(offset: 2em)[strike function is kind of cool tbh!]"
#> attr(,"class")
#> [1] "typst_markup"
sub_(typographic = FALSE, "not typographic")
#> [1] "#sub(typographic: false)[not typographic]"
#> attr(,"class")
#> [1] "typst_markup"
super(typographic = FALSE, "not typographic")
#> [1] "#super(typographic: false)[not typographic]"
#> attr(,"class")
#> [1] "typst_markup"
underline(stroke = pt(3) + olive, "what a weird underline")
#> [1] "#underline(stroke: 3pt + olive)[what a weird underline]"
#> attr(,"class")
#> [1] "typst_markup"
raw_("print('hello world')", lang = "python", block = TRUE)
#> [1] "#raw(lang: \"python\", block: true, \"print('hello world')\")"
#> attr(,"class")
#> [1] "typst_markup"
highlight(extent = pt(3), "hey")
#> [1] "#highlight(extent: 3pt)[hey]"
#> attr(,"class")
#> [1] "typst_markup"
lower("hey")
#> [1] "#lower()[hey]"
#> attr(,"class")
#> [1] "typst_markup"
if (FALSE) image(width = percent(80), height = auto, "../docs/link.svg") # \dontrun{}
circle(fill = blue)
#> [1] "#circle(fill: blue)"
#> attr(,"class")
#> [1] "typst_markup"
ellipse(fill = green)
#> [1] "#ellipse(fill: green)"
#> attr(,"class")
#> [1] "typst_markup"
line(length = percent(80), angle = deg(20))
#> [1] "#line(length: 80%, angle: 20deg)"
#> attr(,"class")
#> [1] "typst_markup"
rect(fill = aqua, radius = pt(3))
#> [1] "#rect(fill: aqua, radius: 3pt)"
#> attr(,"class")
#> [1] "typst_markup"
square(size = pt(5), fill = olive)
#> [1] "#square(size: 5pt, fill: olive)"
#> attr(,"class")
#> [1] "typst_markup"
```
