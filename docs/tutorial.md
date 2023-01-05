---
layout: default
section: examples
---

The Stata Tutorial
==================

In July of 2017 I updated the *Stata Tutorial* for version 15, and it
seemed a good time to convert it to a `markstat` script. In later years
I updated it for Stata 16 and then Stata 17. A big advantage of using
`markstat` is that it was very easy to update the tutorial, and I could
generate a PDF file via LaTeX from the same script used for HTML.

By the time I did the latest update I was in the process of putting
all the Stata and R code from my website in GitHub, starting with the
tutorial. The links below will take you to the source code and
supporting files in GitHub, and the published HTML and PDF versions
on my website.

- [Markstat](https://github.com/grodri/websrc/tree/main/stata)
- [HTML](https://grodri.github.io/stata)
- [PDF](https://grodri.github.io/stata/tutorial.pdf)

If you are interested in reproducing the output the following notes
may be of interest.

Downloading Files
-----------------

If you are familiar with GitHub you can just clone the depository.
Alternatively, the following Stata commands will download all the
files needed to reproduce the PDF.

```
local repo https://raw.githubusercontent.com/grodri/websrc/main/stata/
foreach file in tutorial.stmd tutorial.bib icon17.png stata17.png ///
    stata17doc.png scheme-grlog.scheme _gpnupt.ado tweaks.tex {
    copy `repo'/`file' .        
}
```
The main files are the `markstat` script and bibliography. The introduction
uses three images, the graphics section a custom scheme, and the programming
section an `egen` extension.  To match exactly the style in the published
PDF you also need `tweaks.tex` as discussed below.

The Input Script
----------------

In the source script I used the simple "one tab or four spaces" rule
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
used to highlight version 17, where I used an `img` tag so it appears
only in the HTML version. Another is the screen capture of the Stata
interface, which I coded so it would appear in natural size in HTML and
using the full page width in LaTeX, by coding

```
<img src="stata17.png" class="img-responsive center-block"/>
\includegraphics[width=\linewidth]{stata17.png}
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
date: November 2022
geometry: "margin=1.25in"
fontsize: 11pt
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
Stata 9, which makes the current version the 9th edition.
