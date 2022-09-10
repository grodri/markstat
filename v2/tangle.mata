void tangle(string scalar filename, string scalar format, real scalar strict) {
 // split stmd file into md, do and R files with strict or relaxed syntax
        real scalar fh, dofile, mdfile, chunk, echo, mata, tex, rfile, rchunk, codefile
        string scalar mode, line, tag, closer, code, placeholder, match, prefix, args, lang
    tex = format == "latex" | format == "beamer"
        
        // open files
        fh = fopen(filename + ".stmd", "r")
        mdfile = fopenwr(filename + ".md")
        dofile = fopenwr(filename + ".do")      
        rfile = -1 // on demand
        
        // start do file with log
        fput(dofile, "capture log close")
        fput(dofile, `"log using ""' + filename + `"", smcl replace"')
        
        // read all lines
        chunk = 0
        rchunk = 0
        mode = "markdown"
        while( (line = fget(fh)) != J(0, 0, "")) {
                line = usubinstr(line, uchar(9), "    ", .)

                // Markdown
                if(mode == "markdown") {
                
                        // stata/mata/R code block?
                        if(startsStata(line, strict, echo = 1, lang = "")) {
                                mode = "stata"
                                mata = lang == "m"
                                // consolidate some?
                                if(lang == "s" | lang == "m") {                                 
                                        chunk++                         
                                        // placeholder (as in 1.6.1)
                                        tag = strofreal(chunk)
                                        fput(mdfile, "")
                                        fput(mdfile, "{{" + tag + "}}")
                                        fput(mdfile, "")
                                        // start block
                                        if(echo == 0) tag = tag + "q"
                                        if(mata) tag = tag + "m"
                                        fput(dofile, "//_" + tag)
                                        if(mata) fput(dofile, "mata:")
                                        if(!strict) fput(dofile, usubstr(line, 5, .))
                                } 
                                else { // R
                                        rchunk++
                                        if(rchunk == 1) rfile = fopenwr(filename + ".R")
                                        // placeholder (as in 1.6.1)
                                        tag = strofreal(rchunk)
                                        fput(mdfile, "")
                                        fput(mdfile, "{{r" + tag + "}}")
                                        fput(mdfile, "")
                                        // start block
                                        if(echo == 0) tag = tag + "q"                                   
                                        fput(rfile, "#_" + tag)
                                }
                        }

                        // verbatim or math block?
                        else if(startsBlock(line)) {
                                mode = "block"
                                closer = blockCloser(line)                              
                                fput(mdfile, line)
                        }
                        
                        else {                  
                                // stata/mata/r inline code?
                                while(hasInlineCode(line, code = "", prefix = "")) {
                                        if(prefix == "s" | prefix == "m") {
                                                chunk++
                                                tag = strofreal(chunk)
                                                fput(dofile, "//_" + tag)
                                                // mata
                                                if(prefix == "m") {
                                                        if(startsWith(ustrtrim(code), "%")) {
                                                                args = `"""' + usubinstr(code, " ", `"", "', 1)
                                                        }
                                                        else {
                                                                args = `""%f", "' + code
                                                        }
                                                        fput(dofile, "mata: printf(" + args + ")")
                                                }
                                                // stata
                                                else {
                                                        fput(dofile, "display " + code)
                                                }
                                                placeholder = "{{." + tag + "}}"
                                        }
                                        else { // R
                                                rchunk++
                                                if(rchunk == 1) rfile = fopenwr(filename + ".R")
                                                tag = strofreal(rchunk)
                                                fput(rfile, "#_" + tag)
                                                fput(rfile, code)
                                                placeholder = "{{r." + tag + "}}"
                                        }
                                        match = "`" + prefix + " " + code + "`" 
                                        line = usubinstr(line, match, placeholder, 1)                                   
                                }
                                // code extension/underline
                                if(tex) tag2tex(line)
                                else if (format == "docx") handleUnderline(line)
                                // markdown
                                fput(mdfile, line)
                        }
                }

                // Code Fences or Display Math
                else if (mode == "block") {
                        fput(mdfile, line)
                        if(endsBlock(line, closer)) {
                                mode = "markdown"                               
                        }
                }
                
                // Stata
                else {                  
                        if(endsStata(line, strict)) {
                                mode = "markdown"
                                if(mata) fput(dofile, "end")
                                if(!strict) fput(mdfile, line)
                        }
                        else {
                                if(isIndented(line)) line = usubstr(line, 5, .)
                                codefile = lang == "r" ? rfile : dofile
                                fput(codefile, line)
                        }
                }
        }
        // close files
        fclose(fh)      
        fclose(mdfile)          
        fput(dofile, "//_^")    
        fput(dofile, "log close")
        fclose(dofile)
        if (rfile > -1) {               
                fput(rfile, "#_^")
                fclose(rfile)
                st_local("runr", "runr")
        }       
}
