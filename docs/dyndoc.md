---
layout: default
section: documentation
---

## Stata 15: `dyndoc` and `markstat`

Here is a comparison based on the first example in my paper "Literate Data Analysis with Stata and Markdown"
available [here](https://www.stata-journal.com/article.html?article=pr0067).
You'll first see the equivalent script using Stata 15's `dyndoc`, which produces the output shown [here](dyndoc1.html). (The style could be changed by including a header with a CSS file.)

If you click on the `markstat` tab you will see the original script, using plain Stata and Markdown code with the simple indentation rule. 
This produces the output shown [here](dyndoc2.html), which uses a built-in CSS. 
(More complex examples requiring hiding commands would use the `strict` rule.) .

IMHO the `markstat` version is closer to the spirit of Markdown, easy to read and easy to write, "without looking like it's been marked up with tags or formatting instructions" (Gruber, 2004)

<ul class="nav nav-tabs">
<li class="nav-item"><a class="nav-link active" data-bs-toggle="tab" href="#dyndoc">dyndoc</a></li>
<li class="nav-item"><a class="nav-link" data-bs-toggle="tab" href="#markstat">markstat</a></li>
</ul>

<div class="tab-content">
<pre class="tab-pane active" id="dyndoc">
{% include_relative dyndoc1.do %}
</pre>
<pre class="tab-pane" id="markstat">
{% include_relative dyndoc2.stmd %}
</pre>
</div>
