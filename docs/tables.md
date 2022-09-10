---
layout: default
section: examples
---

## Dynamic Tables

An advantage of Pandoc pipe tables is that they can easily be combined
with inline code to produce dynamic tables.  Here is an example generating a
table showing average gallons per 100 miles for foreign and domestic cars before
and after adjustment for weight. We use a strict code block to te able to hide 
the commands and quietly to supress output, and then display the stored results 
in a pipe table.This is the input:

<div class="text-end"><code>dynatab.stmd</code></div>
<pre>
{% include_relative dynatab.stmd %}
</pre>

And this is how this is rendered by the command `markstat using dynatab`.

<div class="text-end"><code>dynatab.html</code></div>
<iframe src="dynatab.html" width="100%" scrolling="no" class="border mb-3">
</iframe>
 
As usual, you can reproduce this example by typing

    copy https://grodri.github.io/markstat/dynatab.stmd  .
    markstat using dynatab
    
You need to download the script first because `markstat` works with local files.

<script>
{% include_relative iframe.js %}
</script>    