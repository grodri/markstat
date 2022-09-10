---
layout: default
section: examples
---

Tables of Estimates
-------------------

The next example shows how to use Jann\'s `esttab` command in
conjunction with `markstat` to generate a nice table of estimates. The
code below fits two models to the fuel efficiency data and then compares
them side-by-side. We use the strict syntax and supress command echoing
to produce a dynamic report. Here is the input:

<div class="text-end"><code>esttab.stmd</code></div>
~~~~
{% include_relative esttab.stmd %}
~~~~

And this is how this is rendered by the command
`markstat using estimates, strict`. Don\'t forget to specify the
`strict` option.


<div class="text-end"><code>esttab.html</code></div>
<iframe src="esttab.html" class="border mb-3" width="100%" scrolling="no"></iframe>


Here we simply listed the table of estimates as part of the output.
Stata output usually has a border, but I removed it with the css rule
that appears at the end of the script. 

An alternative is to have `esttab` generate a file with the table in html
format and then `.include` it in the document. Unfortunately the table 
includes horizontal rules that conflict with Pandoc's table borders. 

<!-- add a comment/example using Stata 17 `tables` or `etables` -->

<script>
{% include_relative iframe.js %}
</script>