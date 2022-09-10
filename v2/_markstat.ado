program _markstat
        syntax using/ [, pdf docx slides SLIDES2(string) beamer BEAMER2(string) ///
                         markdown mathjax bundle BIBliography strict ///
                                 noDO noR keep KEEP2(string) plain ]

        // input script 
        mata splitPath(`"`using'"') // sets macros
        if "`isurl'" != "" {
                display as error "input must be a local file, not a url"
                display as error "consider using {bf}copy{sf} first"
                exit 632
        }
        if "`suffix'" != "" & "`suffix'" != ".stmd" {
                display as error "file suffix must be .stmd or blank"
                exit 198
        }
        mata st_local("filename", pathjoin("`folder'", "`file'"))
        confirm file "`filename'.stmd"  
        
        // output format
        local formats "`pdf' `slides'`slides2' `beamer'`beamer2' `docx' `markdown'"
        local nformats : word count `formats'
        if `nformats' > 1 {
                display as error "specify at most one of pdf, docx, slides, or beamer"
                exit 198
        }
        local format html
        if `nformats' > 0 local format = strtrim("`formats'")
        if "`pdf'" == "pdf" local format latex
        
        // slide themes
        foreach option in slides beamer {
                if "``option''``option'2'" != "" {
                        local format `option'
                        if "``option'2'" != "" {
                                if strpos("``option'2'", "+") > 0 {
                                        local incremental incremental
                                        local `option'2 = strtrim(subinstr("``option'2'", "+", "", .))
                                }
                                if "``option'2'" != "" local theme ``option'2'
                        }
                }
        }
        if "`format'" == "slides" local format s5               
                
        // syntax
        if "`strict'" == ""{
                mata: st_local("strict", isStrict("`filename'") ? "strict" : "")
        }       
        
        // tangle       
        mata tangle(`"`filename'"', "`format'", "`strict'" == "strict")
        
        // stata
        if "`do'" != "nodo" {
            do `"`filename'"'
        }
        confirm file "`filename'.smcl"

        // R
        if "`runr'" == "runr" {
                if "`r'" != "nor" {
                        di "{bf}Running R{sf}"
                        _runr "`filename'"
                }
                confirm file "`filename'.rout"
        }
        
        // pandoc
        local skip = "`format'" == "docx" | "`format'" == "markdown"
        if `skip' {
                quietly copy "`filename'.md" "`filename'.pdx", replace
        }
        else {
                if "`theme'" != "" local optionaltheme theme(`theme')   
                local options format(`format') `optionaltheme' `incremental' `bibliography' `mathjax' `bundle' 
                di "{bf}Running Pandoc{sf}"
                _pandoc using "`filename'", `options'
        }
                
        // weave
        mata weave(`"`filename'"', "`format'", "`plain'" == "plain")
        
        // docx
        if "`format'" == "docx" {
                di "{bf}Running Pandoc{sf}"
                _pandoc using "`filename'", format(docx) `bibliography'
        }
                
        // pdflatex     
        local tex = inlist("`format'", "latex", "beamer")
        if `tex' {
                di "{bf}Running Latex{sf}"
                whereis pdflatex
                local cmd `""`r(pdflatex)'" "`file'.tex""' 
                if "`folder'" != "" {
                        mata st_local("folder", usubinstr("`folder'", "\", "/",. ))
                        local cmd `"`cmd' -output-directory="`folder'" "'
                }
                shell `cmd'
                confirm file "`filename'.pdf"
        }
        
        // view 
        if "`format'" != "markdown" {
                local outex html
                if `tex' local outex pdf
                if "`format'" == "docx" local outex docx
                view browse "`filename'.`outex'"
        }
        else display `"generated Markdown file "`filename'.md" "'

        // cleanup
        if "`keep'" == "keep" exit
        if "`format'" == "markdown" local keep2 md `keep2'
        mata: cleanup("`filename'", "`keep2'")
end
