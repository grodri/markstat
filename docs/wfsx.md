---
layout: default
section: examples
---

## A Research Article

The first published paper written completely using Stata and Markdown with the `marksat` command appeared in *Demographic Research* on March 22, 2017:

[Germán Rodríguez and Trevor Croft (2017) "Extracting and reshaping World Fertility Survey data in Stata", *Demographic Research*, Volume 36, Article 31, Pages 893-904](https://www.demographic-research.org/volumes/vol36/31/36-31.pdf).

I have to say writing in Markdown instead of LaTeX was a pleasure, and being able to incorporate Stata output without cutting and pasting was priceless.

The paper deals with a Stata command and a small challenge turned out to be the use of underlining to indicate minimal required abbreviations for options, as in <code><u>dir</u>ectory(folder)</code>. The reason is that Markdown does not have a syntax for underlining! A related issue was using italics in a syntax diagram, because the backticks used to indicate code actually mean verbatim.

For HTML output I decided to use the tags `<code>` and `</code>` for code, `<u>` and `</u>` for underlining and `<i>` and `</i>` for italics (for use when * would be taken literally). For LaTeX output `markstat` 1.5.1 or later will translate these tags to the equivalent LaTeX command, and 2.0 or later will also translate them so they work for Word documents.

Returning to the paper, here are links to the input and output files. Recall that you can always download the script directly from Stata.

- [Markstat](wfs.stmd)
- [HTML](wfs.html)
- [PDF](wfs.pdf)

Before you run this script you need to install the `wfs` command, which you can do using the Stata command

`net install wfs, from(https://wfs.dhsprogram.com)`

Or if you prefer, type `net from https://wfs.dhsprogram.com` and follow the link.

Running `markstat` on the source file will then reproduce the published paper except for minor differences in copy editing. Specifically, (1) we kept punctuation outside quoted variable and value labels, and (2) we did not edit Stata output, preserving the usual vertical rules.

