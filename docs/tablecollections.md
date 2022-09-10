---
layout: default
section: examples
---

## Collection Tables

Stata 17 introduced a new system for collecting the results of Stata
command and producing nice customizable tables. The system includes the
commands `collect`, which actually does all the work; `table`, which
makes if easier to produce standard tables, and `etable`, which 
specializes in estimation tables. 

Here we show briefly how to incorporate these tables in `markstat` 
documents, revisiting the examples in [tables of statistics](tabout)
and [tables of estimates](estimates).

### Tables of Statistics <a name="statistics"></a>

The script below reproduces the example using [`tabout`](tabout).

<div class="text-end"><code></code></div>
~~~~
{% include_relative tabstat.stmd %}
~~~~

The `table` statement is pretty simple, specifying the rows, columns,
and the statistic to the calculated. The option `nformat` specifies a
format for numeric output, here `%8.0fc` to round to integers using a
comma to separate thousands.  

If you export the table to html "as is" you will notice that the table
includes a vertical border, and all borders are too thick in my opinion.
Fortunately the new tables are nothing if not customizable. We use
three `collect` commands to remove the vertical border and make the
horizontal borders thinner.

Then we are ready to export the table, amd then simply `.include` it 
in the document.  Stata produces not just `html but also a `css` file 
for each table. `markstat` assumes these files have the same name, so 
please don't use the `cssfile` option of `export`.

The result is [here](tabstat.html) and embedded below.

<iframe src="tabstat.html" class="border mb-3" scrolling="no"></iframe>

### Tables of Estimates <a name="estimates"></a>

The script below reproduces the example using [`esttab`](estimates).

<div class="text-end"><code></code></div>
~~~~
TO COME
~~~~

Again we simple export the table to html and then `.include` it in the 
document. 
The output is [here] and embedded below.

<script>
{% include_relative iframe.js %}
</script>

<small> Updated for `markstat` 2.7</small>
