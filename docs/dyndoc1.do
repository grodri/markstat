<<dd_version: 1.0>>

Stata Markdown
==============

Let us read the fuel efficiency data that is shipped with Stata

~~~~
&lt;<dd_do>>
sysuse auto, clear
&lt;</dd_do>>
~~~~		

To study how fuel efficiency depends on weight it is useful to
transform the dependent variable from "miles per gallon" to
"gallons per 100 miles"

~~~~
&lt;<dd_do>>
gen gphm = 100/mpg
&lt;</dd_do>>
~~~~		

We then obtain a more linear relationship

~~~~
&lt;<dd_do>>
twoway scatter gphm weight || lfit gphm weight ///
    , ytitle(Gallons per Mile) legend(off)
&lt;</dd_do>>
~~~~		
	
<<dd_graph: saving(auto.png) width(500) replace>>

The regression equation estimated by OLS is

~~~~
&lt;<dd_do>>
regress gphm weight
&lt;</dd_do>>
~~~~		
	
Thus, a car that weighs 1,000 lbs more than another requires on
average an extra <<dd_display: %5.1f 1000*_b[weight]>> gallons to travel 
100 miles.

That's all for now!
