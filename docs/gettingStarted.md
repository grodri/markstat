---
layout: default
section: gettingStarted
---

To get started we need a couple of commands and some external tools.

Stata
-----

1\. The `markstat` command is available from the Statistical Software
Components (SSC) archive. To install from net-aware Stata type

`ssc install markstat`

If you have installed an earlier version type
`ssc install markstat, replace` to update. (If you installed an
experimental version please type `ado uninstall markstat` first.)

2\. You also need the `whereis` command, which is also available from the
SSC archive, type

`ssc install whereis`

Both commands come with help files.

Pandoc
------

1\. To convert Markdown to HTML, PDF or DOCX we use an external document
converter called **pandoc**. I find that it works very well and is easy
to install, with binaries for Linux, Mac and Windows.

Please visit [pandoc.org/installing](https://pandoc.org/installing) to
download and install the program. Make sure you make a note of where it
was installed.

2\. Then run the `whereis` command in Stata with the location. For
example on a Windows system where Pandoc was installed for all users, I
typed

`whereis pandoc "c:\program files (x86)\pandoc\pandoc.exe"`

The file path is in quotes because it includes spaces. On a Mac I typed

`whereis pandoc /usr/local/bin/pandoc`

But of course the location may be different in your system. If you have
trouble finding a file type `help whereis` and check out the User Tips
section.

This step is important because `markstat` uses `whereis` to find pandoc.

LaTeX <a name="latex"/>
-----------------------

These steps are only needed if you plan to generate PDF documents via
LaTeX. A simpler alternative is to generate HTML and then ask a browser
such as Chrome to save it as PDF, or read the file into Word and then
save it as PDF.

1\. For best results generating PDF documents we first convert Markdown
to LaTeX using Pandoc, and then use a LaTeX-to-PDF converter.

This will be part of a LaTeX installation such as MikTeX on Windows,
MacTex on Mac OS X, or TeX Live on Unix. Consult your local TeX guru if
you need help installing this tool.

2\. You then use the `whereis` command to register the location of your
converter so `markstat` can find it. For example on a Windows computer
where I had installed MikTeX 2.9 on a folder of the same name on the D:
drive I used

`whereis pdflatex "d:\MiKTeX 2.9\miktex\bin\pdflatex.exe"`

using quotes because the file path includes a space. Again, your
location may differ.

3\. You also need a LaTeX style file called `stata.sty`, which is needed
to render Stata output. This file can be downloaded from the Stata
Journal using the Stata command

`copy https://www.stata-journal.com/production/sjlatex/stata.sty stata.sty`

which will copy the file to your current directory. To avoid having
multiple copies in various folders, consider copying `stata.sty` to your
TeX tree and updating the TeX database. Please consult the documentation
for your LaTeX distribution for instructions.

R <a name="R"><a/>
------------------

In order to run R code you need to have R installed. You then need to
register the location of the R executable with `whereis`. On a Windows
10 system I used the command

`whereis R "c:/program files/R/R-3.4.3/R/bin/x64/R.exe"`

whereas on a Mac running OS X I used

`whereis R Library/Frameworks/R.framework/Resources/bin/R`

but of course your settings may be different. Note the use of uppercase
R in both platforms, and the use of quotation marks when the file name
has a space. Also, the executable name is `R.exe` on Windows but just
`R` on Mac and Linux.
