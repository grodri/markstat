---
layout: default
section: examples
---

## Collection Tables

Stata 17 introduced a new system for collecting the results of Stata
commands and producing nice customizable tables. 
The system includes three commands: 
`collect`, which actually does all the work, 
`table`, which makes it easier to produce standard tables, and 
`etable`, which specializes in estimation tables. 

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
includes a vertical border, and all borders are in my opinion too thick.
Fortunately the new tables are nothing if not customizable. We use
three `collect style` commands to remove the vertical border and make 
the horizontal borders thinner.

Then we are ready to export the table, and then simply `.include` it 
in the document.  Stata produces not just `html` but also a `css` file 
for each table, which by default has the same name. Because `markstat` 
assumes that this is the case, it is best not to change the name using 
the `cssfile` option of `export`.

The result is [here](tabstat.html) and embedded below.

<div class="text-end"><code>tabstat.html</code></div>
<iframe src="tabstat.html" class="border mb-3" width="100%" scrolling="no">
</iframe>

Compare the output with `tabout`'s table [here](tabout).

### Tables of Estimates <a name="estimates"></a>

The script below reproduces the example using [`esttab`](estimates).

<div class="text-end"><code></code></div>
~~~~
{% include_relative tabest.stmd %}
~~~~

The `etable` command makes producing tables of estimates easy, you
run each regression storing the estimates and then call `etable` with
the names of the stored estimates. We use the `column` option to
label the columns with the names of the `estimates`, the default
is the name of the dependent variable. The `showstars` option adds 
the usual significance stars, which can also be customized, and
`showstarsnote` adds and explanatory note.

By default `etable` shows estimates with standard errors in
parentheses, but our `esttab` example included t-statistics
rather than standard errors in parentheses. To reproduce
that feature we specify two *coefficient statistics*, using
`cstat(_r_b)` for the coefficient and `cstat(_r_z, sformat((%s)))`
for the test, adding a string format to enclose the latter in
parentheses.

Once again, if you export the table to html you will see that the borders
are in my opinion too thick, although this time there is no vertical 
border. The two `collect style` commands make the borders thinner.
We then export the table and `.include` it in the document.
The result is [here](tabest.html) and embedded below.

<div class="text-end"><code>tabest.html</code></div>
<iframe src="tabest.html" class="border mb-3" width="100%" scrolling="no">
</iframe>

Compare the output with `esttab`'s output [here](estimates).

<script>
{% include_relative iframe.js %}
</script>

<small> Updated for `markstat` 2.7</small>
