<<dd_version: 1.0>>

Stata Markdown
==============

Let us read the fuel efficiency data that is shipped with Stata

<pre>~~~~
<<dd_do>>
sysuse auto, clear
<</dd_do>>
~~~~		
</pre>

To study how fuel efficiency depends on weight it is useful to
transform the dependent variable from "miles per gallon" to
"gallons per 100 miles"

<pre>~~~~
<<dd_do>>
gen gphm = 100/mpg
<</dd_do>>
~~~~		
</pre>

We then obtain a more linear relationship

<pre>~~~~
<<dd_do>>
twoway scatter gphm weight || lfit gphm weight ///
    , ytitle(Gallons per Mile) legend(off)
<</dd_do>>
~~~~		
</pre>    
	
<<dd_graph: saving(auto.png) width(500) replace>>

The regression equation estimated by OLS is

<pre>~~~~
<<dd_do>>
regress gphm weight
<</dd_do>>
~~~~		
</pre>	
	
Thus, a car that weighs 1,000 lbs more than another requires on
average an extra <<dd_display: %5.1f 1000*_b[weight]>> gallons to travel 
100 miles.

That's all for now!
