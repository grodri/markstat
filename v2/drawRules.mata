void drawRules(string vector lines) {
 // modifies lines in place using IBM drawing characters for rules <>
        string vector c, d
        string scalar line, capture
        real scalar i, k
        
        c = "-", "|", "+", "TLC", "TT", "TRC", "LT", "RT", "BLC", "BT", "BRC"
        d = "─", "│", "┼", "┌",   "┬",  "┐",   "├",  "┤",  "└",   "┴",  "┘"
        
        for(i = 1; i <= length(lines); i++) {
                line = lines[i]
                capture = "\-|\||\+|TLC|TT|TRC|LT|RT|BLC|BT|BRC"
                // corners and singles
                while(ustrregexm(line, "\{c (" + capture + ")\}") > 0) {
                        for(k = 1; k <= length(c); k++) {
                                if(ustrregexs(1) == c[k]) break
                        }
                        line = usubinstr(line, ustrregexs(0), d[k], .)          
                }
                // hlines left for Stata
                lines[i] = line
        }
}
