void tag2tex(string scalar line) {
 // translate code,  underline and italics tags to LaTeX when non-verbatim
        string vector tags, tex
        string scalar left
        real scalar i, w, pos, bot, ignore      
        tags = "<code>", "</code>", "<u>", "</u>", "<i>", "</i>"
        tex  = "\texttt{", "}", "\underline{", "}", "\emph{", "}"
        for(i = 1; i <= 6; i++) {
                w = ustrlen(tags[i])
                pos = 1
                while( (bot = ustrpos(line, tags[i], pos)) > 0) {       
                        ignore = 0
                        if (bot > 1 & bot + w < ustrlen(line)) {
                                ignore = usubstr(line, bot - 1, 1) == "`" & usubstr(line, bot + w, 1) == "`"
                        }
                        if(!ignore) {
                                left = bot > 1 ? usubstr(line, 1, bot - 1) : ""
                                line = left + tex[i] + usubstr(line, bot + w, .)
                        }
                        pos = bot + w
                }
        }
}
