---
layout: default
section: examples
---

The `markstat` Paper
====================

The article introducing the markstat command, \"Literate Data Analysis
using Stata and Markdown\", was published in the *Stata
Journal*, Volume **17**, Number 3, pp. 600-618. You can view the online
abstract, with an option to download the full paper, 
[here](https://www.stata-journal.com/article.html?article=pr0067).

The article was written using `markstat` to combine Markdown and Stata code. 
Below you will find links to the source code, as well as HTML and PDF versions
of the output, both generated from the *same input script*. These
versions differ from the official publication only in copy editing.


-   [Markstat](markstat.stmd)
-   [HTML](markstat.htm)<sup>1</sup>
-   [PDF](markstat.pdf)

The article source was updated to use `markstat`\'s new `bibliography`
option to handle all references, thanks again to the power of Pandoc.
This option is described [here](citations).

In a nutshell, I use a separate bibliographic database in BibTeX format,
[markstat.bib](markstat.bib) (as did my journal submission). 
The paper uses a YAML metadata block to refer to the bibliographic database, 
and in the paper I cite Knuth by writing `[@knuth92]`. 
The references section is generated automatically from the database, and 
includes the entry

> Knuth, Donald. 1992. *Literate Programming*. Stanford, CA: CSLI Lecture
  Notes.

For the record, this is the paper\'s YAML metadata block:

```
---
title: Literate Data Analysis with Stata and Markdown
author: Germán Rodríguez, Princeton University
date: 3 March 2017
abstract: |
  I introduce `markstat`, a command for combining Stata code and output
  with comments and annotations written in Markdown into a beautiful web page
  or PDF file, thus encouraging literate programming and reproducible research.
  The command tangles the input separating Stata and Markdown code, runs
  the Stata code, relies on Pandoc to process the Markdown code, and then
  weaves the outputs into a single file. HTML documents may include inline and
  display math using MathJax. Generating PDF output requires access to LaTeX
  and a style file from Stata, but works with the same input file.
keywords: |
  markdown, pandoc, latex, literate programming,
  dynamic documents, reproducible research.
bibliography: markstat.bib
---
```

As you can see, it includes an abstract and keywords, as well as the link to the
bibliography.

Describing Markdown notation in Markdown can be tricky, and sometimes
leads to a profusion of backticks; but don\'t be alarmed, as this will
not be the case with dynamic documents on other subjects.

<sup>1</sup> I saved the output with extension `.htm` rather than `.html` to
avoid a conflict with this page.