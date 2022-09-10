---
layout: default
section: documentation
---

## BUGS

Inline code for the date does not work with LaTeX. The reason is that
we search for `\usepackage` to insert `\usepackage{stata}` and the
date comes just before this. Need to think of another way to inject
the package.

`quietly` blocks don't work very well because the initial `quietly {`
is echoed by Stata.  Easy to supress if you use a quiet block, but
that will not always be the case. Could look for a line with just 
`quietly {`, but of course the command may be abbreviated. Current
workaround is to use quietly in every line

Trying to center a table imported from the collection system has no
effect because the tags open before the table but close after the
style. Better to target the class, which has the table name