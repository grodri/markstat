---
layout: default
section: examples
---

## Cross-references in LaTeX

A question came up in the 
[Stata forum](https://www.statalist.org/forums/forum/general-stata-discussion/general/1521267-markstat-cross-references) 
regarding cross-references in `markstat` documents. 
If you are generating PDF via LaTeX, you can rely on LaTeX to handle numbering 
and references. I have written a short example showing how this can be done. 
Here are links to the script and resulting pdf file

- [Markstat](crossrefs.stmd)
- [PDF](crossrefs.pdf)

A later question dealt with cross-referencing a table created with `esttab`. 
Hat tip to Giovanni Colitti for providing a solution: just use the `title()` 
option and include a LaTeX `\label{id}` when specifying the table title. 
For more information see the 
[Stata forum post](https://www.statalist.org/forums/forum/general-stata-discussion/general/1536858-cross-referencing-tables-produced-with-esttab-in-markstat).

Unfortunately, these solutions work for LaTeX only. I have been looking for 
more general solutions that work with other output formats. So far the best 
I have found is Nicolai Yakimov’s pandoc-crossref filter, which you can find at 
[https://github.com/lierdakil/pandoc-crossref](https://github.com/lierdakil/pandoc-crossref). 
I am considering incorporating this filter in a future markstat update. 
Comments welcome.
