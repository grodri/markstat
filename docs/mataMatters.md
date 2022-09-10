---
layout: default
section: examples
---

Mata Matters
------------

Dynamic documents with Markdown and Stata may include Mata code as part 
of a Stata block using the simple or strict syntax. It is even possible 
to start a Mata session in one block, add a few comments or annotations, 
and end the session in another block.

Version 1.6 of `markstat` makes this even easier by extending the strict
syntax to allow Mata blocks as well as inline Mata code. In both cases
you simply use an `m` instead of an `s` in the code fence or inline
code.

I thought it would be fun to try to reproduce part of one of Bill
Gould\'s *Mata Matters* columns, and I picked an excerpt from his column
on subscripts. Here is the code. We start with a quiet block to enter
the matrix **X**, and then take up the narrative from the article.

<div class="text-end"><code>mata.stmd</code></div>
<pre>
{% include_relative mata.stmd %}
</pre>

You can see the corresponding [HTML](mata.html) and [PDF](mata.pdf) output, 
or even better, you could run it yourself using the commands:

```
copy https://grodri.github.io/markstat/mata.stmd mata.stmd
markstat using mata, strict
```    

You may want to compare the output with the original *Stata Journal*
article [available
here](https://www.stata-journal.com/article.html?article=pr0028).

When I first ran this script the results differed from the published
output, even though the seed was the same. I thought something might
have changed with Stata since the paper was written, and added a
`version 11` statement to the script. The results then matched 
exactly. And of course, the document was updated without the need to 
cut and paste anything. 

<small> Note: do not set `version 11` *before* running `markstat`, 
as the command requires version 14 or higher and therefore will not
run.  Setting the version inside the script, however, works fine,
as long as the script does not rely on later features.</small>