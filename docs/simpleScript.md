---
layout: default
section: examples
---

A Simple Script
---------------

Here is a simple script drawing a graph and running a regression, using
Markdown annotations and Stata code indented four spaces:

<div class="text-end"><code>auto.stmd</code></div>
<pre>
{% include_relative auto.stmd %}
</pre>

And this is how it is rendered using the command `markstat using auto`

<div class="text-end"><code>auto.html</code></div>
<iframe id="frame" src="auto.html" width="100%" scrolling="no" class="border mb-3">
</iframe>

If you add the `pdf` option, you will obtain the pdf file seen
[here](auto.pdf). If you use the option `docx` instead, you will obtain
the Word document seen [here](auto.docx). By the way this is basically
the example in the `markstat` help file.

<script>
{% include_relative iframe.js %}
</script>
