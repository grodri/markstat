---
layout: default
section: examples
---

Bibliographic Citations
-----------------------

Thanks to the amazing Pandoc, `markstat` now supports bibliographic
references. T
Make sure your software is up-to-date, using Pandoc 2.11 or higher 
and `markstat` 2.6 or higher.
The short script below illustrates the main ideas. 

<div class="text-end"><code>cite.stmd</code></div>
<pre>
{% include_relative cite.stmd %}
</pre>

The script uses a YAML metadata block with a bibliography entry
referring to a BibTeX database; in this case `cite.bib`, which has three
sample references. For example the entry for Knuth's paper appears
below. The complete file is [here](cite.bib).

```
@article{knuth84,
    author  = "Donald Knuth",
    title   = "Literate Programming",
    journal = "The Computer Journal",
    volume  = 27,
    number  = 2,
    pages   = "97--111",
    year    = 1984
}
```

Each entry has a unique key and we can cite it using the syntax
`[@key]`. The citation may include a prefix `[see @key]` and/or a
locator `[@key, page 101]`. If the name has been mentioned already use
`[-@key]`. You may also use just `@key` with author-year formats (read
about styles below).

When you run `markstat` add the `bibliography` option. The command will
coordinate with Pandoc to resolve all the citations and include them in
your dynamic document.

The HTML output for this example, generated with
`markstat using cite, bib`, is [here](cite.html) and is shown below 

<div class="text-end"><code>cite.html</code></div>
<iframe src="cite.html" border="0" width="100%" scrolling="no" class="border mb-3">
</iframe>

Citation Styles
---------------

The default style is the Chicago Manual of Style author-date format, but
you can use any style available in Citation Style Language (CSL), of
which there are more than 8,000 listed in the Zotero Style Repository.
To change style download the `.csl` file and add a reference to it in
the YAML block. For example to change to the IEEE style I downloaded
`proceedings-of-the-ieee.csl` from the repository to my working directory,
and edited the metadata to read

```
---
title: Literate Data Analysis
author: Germán Rodríguez
date: 1 June 2017
bibliography: citations.bib
csl: proceedings-of-the-ieee.csl
---
```

Saving the file as `cite2.stmd` and running `markstat using cite2, bib`
results in the output [here](cite2.html), also shown below: 

<div class="text-end"><code>cite2.html</code></div>
<iframe src="cite2.html" border="0" scrolling="no" width="100%" class="border mb-3">
</iframe>

Note that the only change in the script was the addition of the `csl`
line in the metadata.

When citing entries you may take a shortcut such as `@Knuth84` if you
know you will be using an author-date style, but `Knuth [-@knuth84]` may
be better. It yields the same output for author-date, but includes the
name with numeric formats, rendering Knuth \[1\] for the IEEE style and
Knuth<sup>1</sup> for the AMA style, instead of just \[1\] or
<sup>1</sup>.

<script>
    {% include_relative iframe.js %}
</script>
