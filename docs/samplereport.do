// Stata's samplereport.do
sysuse auto, replace

putpdf begin

// Create a paragraph
putpdf paragraph
putpdf text ("putpdf "), bold
putpdf text ("can add formatted text to a paragraph.  You can ")
putpdf text ("italicize, "), italic
putpdf text ("striketout, "), strikeout
putpdf text ("underline"), underline
putpdf text (", sub/super script")
putpdf text ("2 "), script(sub)
putpdf text (", and   ")
putpdf text ("bgcolor"), bgcolor("blue")
qui sum mpg
local sum : display %4.2f `r(sum)'
putpdf text (".  Also, you can easily add Stata results to your paragraph (mpg total = `sum')")

// Embed a graph
histogram rep
graph export hist.png, replace
putpdf paragraph, halign(center)
putpdf image hist.png

// Embed Stata output
putpdf paragraph
putpdf text ("Embed the output from a regression command into your pdf file.")
regress mpg price
putpdf table mytable = etable

// Embed Stata dataset
putpdf paragraph
putpdf text ("Embed the data in Stata's memory into a table in your pdf file.")
statsby Total=r(N) Average=r(mean) Max=r(max) Min=r(min), by(foreign): summarize mpg
rename foreign Origin
putpdf table tbl1 = data("Origin Total Average Max Min"), varnames  ///
        border(start, nil) border(insideV, nil) border(end, nil)

putpdf save myreport.pdf, replace