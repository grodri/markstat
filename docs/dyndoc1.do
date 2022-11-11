&lt;&lt;dd_version: 1.0&gt;&gt;

Stata Markdown
==============

Let us read the fuel efficiency data that is shipped with Stata

~~~~
&lt;&lt;dd_do&gt;&gt;
sysuse auto, clear
&lt;&lt;/dd_do&gt;&gt;
~~~~		

To study how fuel efficiency depends on weight it is useful to
transform the dependent variable from "miles per gallon" to
"gallons per 100 miles"

~~~~
&lt;&lt;dd_do&gt;&gt;
gen gphm = 100/mpg
&lt;&lt;/dd_do&gt;&gt;
~~~~		

We then obtain a more linear relationship

~~~~
&lt;&lt;dd_do&gt;&gt;
twoway scatter gphm weight || lfit gphm weight ///
    , ytitle(Gallons per Mile) legend(off)
&lt;&lt;/dd_do&gt;&gt;
~~~~		
	
&lt;&lt;dd_graph: saving(auto.png) width(500) replace&gt;&gt;

The regression equation estimated by OLS is

~~~~
&lt;&lt;dd_do&gt;&gt;
regress gphm weight
&lt;&lt;/dd_do&gt;&gt;
~~~~		
	
Thus, a car that weighs 1,000 lbs more than another requires on
average an extra &lt;&lt;dd_display: %5.1f 1000*_b[weight]&gt;&gt; gallons to travel 
100 miles.

That's all for now!
