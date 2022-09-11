---
layout: default
section: examples
---

Quantiles in Stata and R
-------------------------

Starting with version 2.1, `markstat` lets you combine Stata, Mata and R
code blocks and inline code. Here is a simple example regarding the
calculation of quantiles.

<div class="text-end"><code>qsr.stmd</code></div>
<pre>
{% include_relative qsr.stmd %}
</pre>

As you can see, we handle R code the same way as Stata and Mata, using
code fences but with an `r` instead of an `s` or `m`. You can copy and
paste this script, or download it to your working directory using the
command

    copy https://grodri.github.io/markstat/qsr.stmd .

To run this script in Stata you use the command

    markstat using qsr

The script uses the `strict` syntax, but `markstat` 2.1 and higher
detects the use of code fences and sets `strict` mode automatically.
(The `strict` option remains available for rare cases where
autodetection will not work, such as files with indented Markdown but no
Stata, Mata or R code.)

You can see the html output [here](qsr.html).

For this to work you need to have R installed, and you need to use
`whereis` from SSC to register the location of R in your computer. I
recommend you first update `whereis` to make sure you have the latest
version. Then follow the R instructions on [Getting
Started](gettingStarted#R), which has registration examples for Windows
10 and Mac OS X.

This particular script also requires R's `haven` package to read Stata
files. Stas Kolenikov pointed out that you could modify the script to
install the package on demand, replacing `library(haven)` with

```
tryCatch(library("haven"), 
    error = function(e) install.packages("haven", repos="https://cloud.r-project.org"),
    finally = library("haven"))
```

For a more extensive example, see this [page](stata-r-tabs), which uses
Bootstrap tabs to switch between Stata and R in a Cox regression.

### Reference

Hyndman, R. J. and Fan, Y. (1996) Sample quantiles in statistical
packages, *American Statistician* 50:361-365.
[](https://www.amherst.edu/media/view/129116/.../Sample+Quantiles.pdf)

<p>
<small>New in markstat 2.1</small>
</p>
