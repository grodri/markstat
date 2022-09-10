string vector translateLog(string scalar filename, string scalar format, real scalar plain) {
 // process rules in smcl log, then translate to plain text or TeX
        real scalar changed, fh, i, tex
        string scalar infile, logfile, cmd, dashes, hrule, width, options
        string vector lines
        
        // get smcl
        infile = filename + ".smcl"
        lines = cat(infile)
        changed = 0
        
        // smart rules using drawing characters
        tex = format == "latex" | format == "beamer"
        if(!tex & !plain) {             
                drawRules(lines)
                changed = 1
        }

        // save copy of log
        if(changed) {
                infile = st_tempfilename()
                fh = fopenwr(infile)
                fputvec(fh, lines)
                fclose(fh)
        }
        
        // translate smcl to TeX or Unicode text
        logfile = st_tempfilename()
        cmd = tex ?   "log texman " : "translate "
        cmd = cmd + `"""' + infile + `"" ""' + logfile + `"""'
        width = strofreal(c("linesize"))
        options = (tex? ", ll(" : ", translator(smcl2log) linesize(") + width + ")"             
        stata("quietly " + cmd + options)
        lines = cat(logfile)
        
        // handle hlines (3 or more -)
        if(!tex) {
                for(i = 1; i <= length(lines); i++) {
                        while(ustrregexm(lines[i], "(--[-]+)") > 0) {
                                dashes = ustrregexs(1)
                                hrule = ustrlen(dashes) * "─"  // 226, 148, 128
                                lines[i] = usubinstr(lines[i], dashes, hrule, 1)
                        }
                }
        }
        
        // return translated log        
        return(lines)
}
