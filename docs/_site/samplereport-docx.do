sysuse auto, replace

putdocx begin

// Create a paragraph
putdocx paragraph
putdocx text ("putdocx "), bold
putdocx text ("can add formatted text to a paragraph.  You can ")
putdocx text ("italicize, "), italic
putdocx text ("strikeout, "), strikeout
putdocx text ("underline"), underline
putdocx text (", sub/super script")
putdocx text ("2 "), script(sub)
putdocx text (", and ")
putdocx text ("shade"), shading("blue")
qui sum mpg
local sum : display %4.2f `r(sum)'
putdocx text (".  Also, you can easily add Stata results to your paragraph (mpg total = `sum')")

// Embed a graph
histogram rep
graph export hist.png, replace
putdocx paragraph, halign(center)
putdocx image hist.png

// Embed Stata output
putdocx paragraph
putdocx text ("Embed the output from a regression command into your docx file.")
regress mpg price
putdocx table mytable = etable

// Embed Stata dataset
putdocx paragraph
putdocx text ("Embed the data in Stata's memory into a table in your docx file.")
statsby Total=r(N) Average=r(mean) Max=r(max) Min=r(min), by(foreign): summarize mpg
rename foreign Origin
putdocx table tbl1 = data("Origin Total Average Max Min"), varnames
        border(start, nil) border(insideV, nil) border(end, nil)

putdocx save myreport.docx, replace