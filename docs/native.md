---
layout: default
section: documentation
---

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

This is the clipboard <i class="bi-clipboard"></i>

I could have a `native` option that will use only official commands.
It could be done in either of two ways:

1. Translate the `.stmd` script into a `dyndoc` document, which
will then generate `html` or `docx`.

2. Run `tangle`, then use `markdown` to translate Markdown, and
the `weave` the output together. 

Neither approach can use metadata, use citations and bibliographies,
or generate slide shows, nor use any Pandoc extensions, such as 
pipe tables. How about mathematical equations?

Both approaches can generate `html` and `docx`, 
but only the second can generate `pdf`. 
(Of course you can always translate `html` and `docx` to pdf.)

Approach 1 is fully native, and does not use the IBM drawing characters
to render Stata output.  Approach 2 uses `markstat` own translation of
the SMCL logs.  

I think approach 2 is functionally equivalent to running `markstat`
with the `markdown` option and then running Stata's `markdown` on the
output. 

I have noticed problems passing the drawing characters to LaTeX, something
to do with Unicode and fonts. 