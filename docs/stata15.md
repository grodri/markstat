---
layout: default
section: documentation
---

<style>
pre.stata {font-size:14px; line-height:14px;}
</style>

Stata 15
--------

Stata 15 was released on June 6, 2017 and I got my copy three days
later. The big news is that it includes support for Markdown and dynamic
documents through three new commands: `dyndoc`, `putpdf` and `putdocx`.
It also has a `markdown` command to convert Markdown to HTML.

How do these tools compare with `markstat`? Obviously the main
difference is that the new commands are part of official Stata, whereas
`markstat` relies on Pandoc and, for PDF targets, on a LaTeX
installation. On the other hand, `markstat` has a simpler syntax and
provides additional functionality via Pandoc, the most important of
which is the ability to generate HTML, PDF and DOCX output from the 
same input script.

Here are my first impressions.

### 1. Cleaner Scripts

Stata's `dyndoc` uses the following syntax for code blocks

``````
~~~~
<<dd_do>>
sysuse auto, clear
summarize mpg
<</dd_do>>
~~~~
``````

Note the use of both a Markdown code fence `~~~~` and a dynamic tag
`<<dd_do>>`. In contrast, `markstat` relies on a simple "one tab or four
spaces" indentation rule

```
    sysuse auto, clear
    summarize mpg
```

An alternative to allow more control, such as hiding Stata code, is to
specify the `strict` option and use code fences

~~~~
```s
    sysuse auto, clear
    summarize mpg
```
~~~~

I believe this leads to more readable input scripts, much in the spirit
or Markdown itself. Checkout this comparison with Stata's [`dyndoc`
example](dyndoc) The difference is more noticeable in complex
documents with lots of code.

Also, `markstat` lets you introduce Mata code blocks using an `m`
instead of an `s` in the code fence. For an example see [Mata
matters](mataMatters).

### 2. Nicer Output

Compare the HTML output of `dyndoc` using the previous two commands

```
. sysuse auto, clear
(1978 Automobile Data)

. summarize mpg

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
         mpg |         74     21.2973    5.785503         12         41
```

With the output from `markstat`

<pre class="stata">
. sysuse auto, clear
(1978 Automobile Data)

. summarize mpg

    Variable │        Obs        Mean    Std. Dev.       Min        Max
─────────────┼─────────────────────────────────────────────────────────
         mpg │         74     21.2973    5.785503         12         41

</pre>

Just a cosmetic issue, but `markstat`s HTML output is more in line with
PDF output.

### 3. Inline Code

Inline code in `dyndoc` uses a dynamic tag:

    The average fuel efficiency is <<dd_display: %4.2f `r(mean)'>>.

The equivalent `markstat` code is a bit less obtrusive and easier to
type

    The average fuel efficiency is `s %4.2f r(mean)`.

Moreover, `markstat` supports inline Mata code using an `m` instead of
an `s`. (This is also the syntax of R markdown, which uses an `r`.)

### 4. Metadata

`markstat` takes advantage of Pandoc's support for metadata, using a
simple three-line syntax for author, title and date (which may be inline
code):

```
% Literate Data Analysis
% Germán Rodríguez
% `s c(current_date)`
```

`markstat` also supports more general YAML blocks. For more information
see [metadata](metadata).

### 5. Bibliographies

Thanks again to the amazing Pandoc, `markstat` supports citations. The
basic idea is to prepare a BibTeX file with the references. You can then
cite them in the text, for example typing `@knuth84` to refer to his
literate programming paper. The `bib` option of `markstat` will arrange
for Pandoc to format the citations, look them up in the BibTeX database,
and generate a list of references at the end of your document, in a
style of your choice. For example Knuth's paper will appear in the
default Chicago style as

> Knuth, Donald. 1984. "Literate Programming." The Computer Journal 27
> (2): 97---111.

For a quick example see [citations](citations). A more extended
example is provided by my Stata Journal paper introducing `markstat`,
Check out [this page](markstat) to access the source code of the paper,
the BibTeX database used to resolve the references, and the resulting 
HTML and PDF versions.

### 6. PDF Output

I think a big advantage of `markstat` is that it can generate a PDF file
from the same input script, admitedly at the expense of needing a LaTeX
distribution. But once you have jumped the installation hurdle, all you
do is add the `pdf` option, as explained in the original paper.

The `dyndoc` command generates HTML only. There is a new `putpdf`
command, but this is really a lower-level command; it provides a lot of
control, but seems aimed more at programmers than regular users. Compare
typing the text

```
You can *italicize*, ~~strikeout~~, <u>underline</u>, sub/super script~2~
```

with writing the commands

```
putpdf text ("You can ")
putpdf text ("italicize, "), italic
putpdf text ("strikeout, "), strikeout
putpdf text ("underline"), underline
putpdf text (", sub/super script")
putpdf text ("2 "), script(sub)
```

A comparison of `markstat` with `putpdf` using the example in the Stata
announcement may be found [here](putpdf).

For longer examples, you can see both the input script and the HTML and
PDF output for my papers on the [wfs](wfsx) and [markstat](markstat)
commands, as well as the `markstat` version of my [Stata
tutorial](tutorial).

### 7. Word Documents

`markstat` 2.0 and higher can also generate a Word document from the
same input script using the `docx` option. As noted above, `dyndoc` can
generate HTML only<sup>*</sup>. There is a new `putdocx` command, but again this is
really a lower-level command; it provides a lot of control but at a
price, compare typing the script

```
You can *italicize*, ~~strikeout~~, <u>underline</u>, sub/super script~2~
```

which by the way is exactly the same as in 6 above, with writing the
commands

```
putdocx text ("You can ")
putdocx text ("italicize, "), italic
putdocx text ("strikeout, "), strikeout
putdocx text ("underline"), underline
putdocx text (", sub/super script")
putdocx text ("2 "), script(sub)
```

A comparison of `markstat` with `putdocx` using the example in the Stata
announcement may be found [here](putdocx). Another example using
the proverbial fuel efficiency data may be found [here](docx). Please note
that the `docx` option works best with Pandoc 2.0 or higher.

<sup>*</sup><b>Update</b>. Stata 16 added a `docx` option to `dyndoc`,
so it can generate a Word document from a Markdown script with Stata
dynamic tags. There are also improvements to `putdocx` and new commands
`html2docx` and `docx2pdf` for converting across formats. 

### 8. Dynamic Presentations

`markstat` 2.0 and higher can also generate HTML presentations using the
S5 engine, or PDF presentations via LaTeX using Beamer, all thanks to
the amazing Pandoc. You use metadata to specify the title, author and
date of the presentation, which are used to generate a title slide. You
then author your slides using Markdown for your narrative, including
bullet points which can be shown incrementally, and Stata code and
results. For an introductory example see [dynamic
presentations](presentations.html).

Stata 15 has no equivalent commands. It is possible to author your
slides directly in HTML or LaTeX and embed Stata code and results using
Stata 15's `dyntext`, but then you have to deal with the complexity of
writing HTML or LaTeX code instead of simple Markdown.

Also, `markstat` uses the same script for both output formats, and the
new `nodo` option lets you tinker with your presentation, and change
engines and/or themes, without having to rerun the analysis. (Hat tip to
Ben Jann, who provides a `nodo` option in `texdoc`) Finally, the new
`bundle` option lets you produce self-contained HTML presentations, with
all graphs as well as ancillary CSS and JavaScript files included in the
document using base64 encoding. Beamer presentations are always
self-contained.

### 9. R Code

Not a relevant comparison here, but in addition to Stata and Mata code,
`markstat` lets you use R code, both in fenced blocks and inline. For an
example see a comparison of how Stata and R compute
[quantiles](quantiles).


<small>Updated for markstat 2.0</small>

