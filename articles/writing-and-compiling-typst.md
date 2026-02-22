# Writing and compiling typst

[r2typ](https://y-sunflower.github.io/r2typ/) provides functions to help
you write and compile your Typst markup, without you having to worry
about installing Typst.[¹](#fn1)

``` r
library(r2typ)
```

We can write a typst file using
[`typst_write()`](https://y-sunflower.github.io/r2typ/reference/typst_write.md):

``` r
typst_code <- c("= Hello World", "This is a Typst document.")
output_file <- typst_write(typst_code)
```

Then we can compile this file to PDF with
[`typst_compile()`](https://y-sunflower.github.io/r2typ/reference/typst_compile.md):

``` r
typst_compile(output_file)
```

## Control file names

Both
[`typst_write()`](https://y-sunflower.github.io/r2typ/reference/typst_write.md)
and
[`typst_compile()`](https://y-sunflower.github.io/r2typ/reference/typst_compile.md)
have an optional `output` arguments to control file names:

``` r
typst_code <- c("= Hello World", "This is a Typst document.")
output_file <- typst_write(typst_code, "here.typ")
typst_compile(output_file, "report.pdf")
```

[r2typ](https://y-sunflower.github.io/r2typ/) also offers a
[`is_valid_typst()`](https://y-sunflower.github.io/r2typ/reference/is_valid_typst.md)
that returns `TRUE`/`FALSE` depending on if the code can be compiled or
not. Check out that the [dedicated
vignette](https://y-sunflower.github.io/r2typ/typst-validation.hml).

------------------------------------------------------------------------

1.  This is possible because
    [r2typ](https://y-sunflower.github.io/r2typ/) uses a Rust backend
    for
    [`typst_compile()`](https://y-sunflower.github.io/r2typ/reference/typst_compile.md),
    which allows it to use the Rust Typst library natively.
