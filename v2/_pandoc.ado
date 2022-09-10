program _pandoc
* interface to Pandoc to convert Markdown to html, latex or docx
    syntax using/ [, format(string) theme(string) incremental BIBliography mathjax bundle]
        local filename `using'
        whereis pandoc
        local pandoc = r(pandoc)
        if "`bibliography'" == "bibliography" {
                local args --citeproc           
        }
        // format and theme
        local args `args' -f markdown -t `format'
        if "`format'" == "beamer" & "`theme'" != "" {
                local args `args' -V theme=`theme'
        }
        if "`format'" == "s5" {         
            if "`theme'" == "" local theme default
                mata: unzipS5() // ensure installed
                mata: st_local("s5", getFolder(findFile("s5/`theme'/slides.css")))
                confirm file "`s5'/slides.js"
                local args `args' -V s5-url="`s5'"
        }
        // incremental
        if "`incremental'" == "incremental" {
                local args `args' -i
        }
        // mathjax and bundle
        if "`mathjax'" == "mathjax" local mj --mathjax
        if "`bundle'" == "bundle" & inlist("`format'", "html", "s5") {
                local args `args' --self-contained
                if "`mj'" != "" {
                        whereis(mathjax)
                        local mj `mj'="`r(mathjax)'"
                }
        }
        local args `args' `mj'

        // docx with custom template
        if "`format'" == "docx" {
                mata: st_local("docx", findFile("markstat.docx"))
                confirm file "`docx'"
                local args `args' --reference-doc="`docx'"      
        }
        
        // pandoc
        local outex pdx
        if "`format'" == "docx" local outex docx
        capture erase "`filename'.`outex'"
        local cmd `""`pandoc'" "`filename'.md" `args' -s -o "`filename'.`outex'""'
        shell `cmd'
        confirm file "`filename'.`outex'"
end
