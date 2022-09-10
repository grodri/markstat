---
layout: default
section: examples
---

Tables of Statistics
--------------------

Ian Watson\'s `tabout` can produce beautiful frequency tables and tables
of summary statistics, with output in LaTeX or HTML, and as noted in
Chapter 9 of the User\'s Guide for version 3, it can also produce
dynamic documents.

Here we show how you can combine the power of `tabout` with the
simplicity of `markstat` to produce dynamic documents, using an
abbreviated version of the example on page 72 and table 34 of [the
User\'s Guide](http://tabout.net.au/downloads/tabout_user_guide.pdf).

Note that we use `tabout` to generate `table34.html` and then simply
`.include table34.html` in the document. We omit the options `topf`,
`topstr`, `botf` and `botstr`, using simple Markdown with inline code
instead. Here is the script

<div class="text-end"><code>tabout1.stmd</code></div>
~~~
{% include_relative tabout1.stmd %}
~~~

And this is how the script is rendered by the command `markstat using tabout`.

<div class="text-end"><code>tabout1.html</code></div>
<iframe src="tabout1.html" width="100%" scrolling="no" class="border mb-3">
</iframe>

*Note*. `tabout` generates the table title and footer as separate
paragraphs rather than a `caption` and `tfoot`. As a result they are not
centered when the table is centered. To keep everything together I
wrapped the table in center tags. I also added a CSS rule at the end
to make sure the table width was automatic.

To obtain LaTeX output you just need to change the output to
`using table34.tex`, the style to `style(tex)`, and then use
`\input{table34.tex}` instead of `.include`.

In order to convert the generated LaTeX to PDF, however, we need to add
four packages used by `tabout` which are not included in the Pandoc
template. Fortunately this is easy to do with \"header includes\". This
example uses only the first three packages, but I include all four for
completeness. At the start of the script simply insert this YAML block:

<pre>
---
header-includes:
  - \usepackage{multicol}
  - \usepackage{tabularx}
  - \usepackage{booktabs}
  - \usepackage{lscape}
---
</pre>

The revised script is available [here](tabout2.stmd) and the resulting
pdf file is [here](tabout2.pdf).

The same approach can be used with other Stata commands that generate
HTML or LaTeX output.

<script>
{% include_relative iframe.js %}
</script>