void weave(string scalar filename, string scalar format, real scalar plain) {
 // weave stata, R and markdown output into html, latex or markdown file

        real scalar outfile, infile, n, tex, md
        real vector markers, rmarkers
        string scalar outext, line, blockhold, inlinehold, logline, includefile, w, prefix 
        string vector lines, rlines, words
 
        // output file
        tex = format == "latex" | format == "beamer"
        md  = format == "docx"  | format == "markdown"
        outext = tex ? ".tex" : (md ? ".md" : ".html")
        outfile = fopenwr(filename + outext)
        
        // get translated smcl
        lines = translateLog(filename, format, plain)
        markers = select(1::length(lines), ustrregexm(lines, "[.|:]\s+//_") :> 0)
        rlines = J(0, 1, "")
        
        // open Pandoc output 
        infile = fopen(filename + ".pdx", "r")  
        if(tex) { 
                while( (line = fget(infile)) != J(0, 0, "")) {
                        fput(outfile, line)
                        if(startsWith(line, "\usepackage{")) {
                                fput(outfile, "\usepackage{stata}")
                                break
                        }
                }
        }

        // code placeholders and handlers
        blockhold  = "\{\{(r?)([0-9]+)\}\}"
        inlinehold = "\{\{(r?)\.([0-9]+)\}\}"                           
        if(tex) {
                blockhold  = usubinstr(blockhold, "\", "\\\", .)
                inlinehold = usubinstr(inlinehold, "\{", "\\\{", .)
                inlinehold = usubinstr(inlinehold, "\}", "\\\}", .)
        }
        else if (!md) {
                blockhold = "<p>" + blockhold + "</p>"
        }
        // process pdx file
        n = 0
        while( (line = fget(infile)) != J(0, 0, "") ) {
                
                // handle code block (number is second capture)
                if(ustrregexm(line, blockhold) > 0) {
                        n = strtoreal(ustrregexs(2))
                        if(ustrregexs(1) == "") { // stata
                                renderLog(outfile, format, lines, markers[n], markers[n + 1] - 1, "stata")
                        }
                        else { // R
                                if(length(rlines) < 1) {
                                        rlines = cat(filename + ".rout")
                                        rmarkers = select(1::length(rlines), usubstr(rlines, 1, 4) :== "> #_")
                                }
                                renderLog(outfile, format, rlines, rmarkers[n], rmarkers[n + 1] - 1, "r")
                        }
                }
                // handle includes (html only)
                else if (ustrregexm(line,"<p>.include ([^<]+)</p>") > 0) {                      // move this to a command
                        includefile = addSuffix(ustrregexs(1), ".html")
                        printf(".include file %s\n", includefile)
                        if(!fileexists(includefile)) {
                                errprintf("include file %s not found", includefile)
                                exit(601)
                        }
                        fputvec(outfile, cat(includefile))
						// add css file if it exists
						includefile = usubinstr(includefile,".html",".css", 1)
						if(fileexists(includefile)) {
							fput(outfile,"<style>")
							fputvec(outfile, cat(includefile))
							fput(outfile,"</style>")
						}
                }
                // resize LaTeX graphs  
                else if (startsWith(line,"\includegraphics{")) {
                        w = format == "beamer" ? "0.60" : "0.75"
                        line = usubinstr(line, "{", "[width=" + w + "\linewidth]{", 1)
                        fput(outfile, line)
                }
                else {  
                        // handle inline code for Stata and R
                        while(ustrregexm(line, inlinehold) > 0) {
                                prefix = ustrregexs(1)
                                if(prefix == "r" & length(rlines) < 1) {
                                        rlines = cat(filename + ".rout")
                                        rmarkers = select(1::length(rlines), usubstr(rlines, 1, 4) :== "> #_")
                                }
                                n = strtoreal(ustrregexs(2))
                                logline = prefix == "" ? lines[markers[n] + 2] : rlines[rmarkers[n + 1] - 1]
                                logline = ustrtrim(logline)
                                if (prefix == "r") { 
                                        words = tokens(logline)
                                        if(length(words) > 1) logline =  ustrtrim(words[2])
                                }                               
                                if(!tex & !md) logline = htmlEncode(logline, 1, 1)
                                line = usubinstr(line, ustrregexs(0), logline, 1)                               
                        }                               
                        // inject css
                        if(format == "html" && n == 0) { 
                                if(ustrtrim(line) == "</head>") injectCss(outfile)
                        }
                        // write markdown
                        fput(outfile, line)                             
                }
                
        }
        fclose(infile)
        fclose(outfile)
}               
