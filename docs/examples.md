---
layout: default
section: examples
---

<style>
a.example {font-size: 1.25rem; color:#333; text-decoration:none;}
a.example:visited {color#333;} 
</style>

<!-- 
Solution for name conflicts: keep the page name, as these are more likely
to be linked, and change the script and therefore output file names.
-->

Here is a collection of examples illustrating a number of `markstat` features.
Each example comes with a script that you can download and run on your computer.

<a class="example" href="simpleScript">A Simple Script.</a> 
A very simple script that reads a Stata system file, draws a graph and runs
a regression.

<a class="example" href="bundledImages">Bundled Images.</a> 
Illustrating the `bundle` option that includes all images in base64 encoding,
making the page self-contained.

<a class="example" href="metadata">Using Metadata.</a> 
A basic illustration of the two formats for including title, author and date
information in your document.

<a class="example" href="tables">Dynamic Tables.</a>
Where we show how to combine Pandoc pipe tables with `markstat` inline code
to produce reports that include dynamic tables.

<a class="example" href="estimates">Tables of Estimates.</a> 
An example using Ben Jann's `esttab` command with `markstat` to generate a
nice table of estimates

<a class="example" href="tabout">Tables of Statistics.</a> 
Ian Watson's `tabout` command can produce beautiful frequency tables and
tables of summary statistics in LaTeX or HTML

<a class="example" href="wfsx">A Research Article.</a> 
The first published paper written completely with `markstat`, published
in *Demographic Research* on March 22, 2017.

<a class="example" href="mataMatters">Mata Matters.</a> 
Introduces the use of Mata code blocks in `markstat`, by reproducing part 
of one of Bill Gould's *Mata Matters* columns.

<a class="example" href="citations">Bibliographic Citations.</a> 
Thanks to the amazing Pandoc, `markstat` supports bibliographic references
and citations, using many styles.

<a class="example" href="markstat">The Markstat Paper.</a> 
The article introducing `markstat`, written of course using Markdown and
Stata with `markstat`, updated to use the <u>bib</u>liography option.

<a class="example" href="tutorial">The Stata Tutorial.</a> 
The *Stata Tutorial*, which I converted to `markstat` for Stata version 15 
in 2017, and updated as new releases came out. Now updated for Stata 18.

<a class="example" href="docx">Dynamic Word Documents.</a> 
Starting with version 2.0, `markstat` can generate Word documents from the
same script used to produce HTML and PDF.

<a class="example" href="presentations">Dynamic Presentations.</a> 
`markstat` leverages the amazing Pandoc to support presentations
in HTML with the S5 engine or in LaTeX using Beamer.

<a class="example" href="twoColumnSlides">Two-Column Slides.</a> 
When Pandoc added support for columns we were able to produce slides
that show code and graphs side-by-side.

<a class="example" href="quantiles">Quantiles in Stata and R.</a> 
`markstat` 2.1 and higher lets you combine Stata, Mata and R code,
which we illustrate showing how Stata and R use different defaults
when calculating quantiles.

<a class="example" href="stata-r-tabs">Stata and R Tabs with Bootstrap.</a> 
My computing handouts often show how to do things in Stata and R, 
so students have a choice of software. Here I show how to use
Bootstrap tabs to select Stata and R versions of a page.

<a class="example" href="crossref">Cross-references in LaTeX.</a> 
Where I expand on a Stata Forum question on cross-references, 
showing a solution that works with LaTeX, with a note on ongoing 
work on other output formats.

<a class="example" href="collectionTables">Collection Tables.</a>
Stata 17 introduced a system for producing highly-customizable 
publication-quality tables. Here we show two examples incorporating 
such tables in `markstat` documents.

<a class="example" href="appliedStatistics">Applied Statistics.</a>
The computing logs for my courses on Multilevel Models, Survival 
Analysis and Demographic Methods have all been redone using `markstat`.
That's 62 examples using Stata and R.