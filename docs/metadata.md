---
layout: default
section: examples
---

Using Metadata
--------------

Pandoc understands metadata. Just start your file with three lines that
begin with a % and correspond to the author, title and date. The title
may span more than one line, and multiple authors can have a line each,
provided continuation lines start with a space. Please see the Pandoc
manual for full details. The date may be inserted using inline code to
retrieve Stata's current date, as in the example below.

<div class="text-end"><code>meta.stmd</code></div>
<pre>
{% include_relative meta.stmd %}
</pre>

And this is how it is rendered by the command `markstat using meta`

<div class="text-end"><code>meta.html</code></div>
<iframe src="meta.html" width="100%" scrolling="no" class="border mb-3">
</iframe>

In addition to including the title, author and date as headings at level
1 to 3, Pandoc generates a title tag and a meta tag to list the
author(s) as metadata, a feature you can see if you view the source for
the above frame in your browser.

YAML Metadata
-------------

An alternative way to enter metadata is through YAML blocks, which begin
and end with three dashes and can include the title, author and date, as
in the following example:

<pre>
---
title: Metadata
author: Germán Rodríguez
date: "`s c(current_date)`"
---
</pre>

Note the use of quotes around the inline code for the date, which are
needed to keep YAML happy. Quotes would also be needed in the title
if it contains a colon. If there is more than one author you use a
YAML array, with each author in a line starting with a hyphen with
spaces before and after, as in the following example

<pre>
---
title: Your Title Here
author:
 - First Author
 - Second Author
date: "`s c(current_date)`"
---
</pre>

An advantage of YAML blocks is that they may be used to provide other
information to Pandoc, including bibliographic information for resolving
citations as explained [here](citations), or an abstract that is used in
PDF documents via LaTeX. For an example using both features see [this
paper](markstat).

<script>
    {% include_relative iframe.js %}
</script>
