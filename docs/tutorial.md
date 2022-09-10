---
layout: default
section: examples
---

The Stata Tutorial
==================

In July of 2017 I updated the *Stata Tutorial* for version 15, and it
seemed a good time to convert it to a Stata Markdown script to be
processed with `markstat`. In September of 2019 I updated it again, this
time for version 16. A big advantage of using `markstat` is that it was
very easy to update the tutorial, and I could generate a PDF file via
LaTeX from the same script used for HTML. 

The links below provide access to the `markstat` script, the 
bibliography file, and an ancillary file used for PDF output as
explained below. 
The published HTML and PDF files are also linked below.

- [Markstat](stataTutorial.stmd)
- [bibliography](stataTutorial.bib)
- [tweaks](tweaks.tex)

- [HTML](https://data.princeton.edu/stata)
- [PDF](https://data.princeton.edu/stata/tutorial.pdf)

If you are interested in running the script yourself, note that you need 
to have  the file `_gpnupt.ado` available in the working directory or
your personal ado folder, as it is used in one of the examples. 
The file can be downloaded [here](_gpnupt.ado) or copied and
pasted from Section 4.3.6 of the tutorial. 
To generate PDF you will also need the file `tweaks.tex` to
match the style I used. The following notes may also be of interest
in reproducing the output.

The Input Script
----------------

In the source script I used the simple \"one tab or four spaces\" rule
to indent code that should be run through Stata. To list code that is
not to be run through Stata, for example to explain the syntax of a
`while` loop, I used code fences as follows:

~~~~
```
while condition {
    ... do something ...
}
```
~~~~

The code is rendered in HTML as a preformatted block, and in LaTeX as a
`verbatim` environment.

You will also note that I coded graphs using a caption-less figure, as
in

```
![](scatter.png){.img-responsive .center-block}
```

The website uses the Bootstrap framework, and the two classes,
`img-responsive` and `center-block` ensure that the figure is centered
and displays well in devices of varying sizes. One exception is an image
used to highlight version 16, where I used an `img` tag so it appears
only in the HTML version. Another is the screen capture of the Stata
interface, which I coded so it would appear in natural size in HTML and
using the full page width in LaTeX, by coding

```
<img src="stata16.png" class="img-responsive center-block"/>
\includegraphics[width=\linewidth]{stata16.png}
```

This takes advantage of the fact that Pandoc will pass along HTML and
LaTeX code to the appropriate target format and ignore it otherwise.

I also collected all the bibliographic references in a BibTeX file, and
cited them all using the `nocite` convention. The YAML block listed
further below references the bibliography file and has a literal
\"nocite\" field.

To publish the HTML to my website I split it into four files, one per
section, adjusting the links.

Tweaking LaTeX
--------------

I used caption-less figures because they appear nicely centered in the
HTML output, but unfortunately LaTeX will add a figure number to the
otherwise empty caption. This is easily avoided however, using the LaTeX
command `\usepackage[labelformat=empty]{caption}`, which adds the
`caption` package with an option to supress labels. This is the only
required tweak, and is easily added as part of the YAML block, but I
decided to add a few more and collect them in a file called
`tweaks.tex`. The YAML block used then reads

```
---
title: Stata Tutorial 
author: Germán Rodríguez
date: September 2019
header-includes:
  - \input{tweaks.tex}
bibliography: tutorial.bib
nocite: |
 @*
---
```

If you list the `tweaks.tex` file you will see that it uses

-   the `caption` package to supress figure numbers as noted above,

-   the `titling` package to modify rendering the title and author. I
    wanted to use a large bold sans serif font and include a subtitle
    and the URL of the tutorial. I also wanted to add my affiliation to
    the author field.

-   the `sectsty` package to modify the fonts used in all the section
    titles (including subsections, subsubsections, paragraphs and
    subparagraphs), using bold sans serif fonts of appropriate sizes.

-   the `fancyvrb` package to modify `verbatim` blocks so they match
    exactly the `stlog` environments used for Stata output.

These are just aesthetic changes that do not affect the content of the
tutorial, but allow you to reproduce exactly the published file by
simply typing `markstat using stataTutorial, pdf bib`.

Something else you may toy with when generating a PDF document is page
breaks. Having looked at the document, however, I decided that the few
cases where code or output was split across pages were alright and
decided to let them be.

*Note*. The *Stata Tutorial* was first published in 2006 and targeted
version 9, which makes the current version the 8th edition.
