real scalar startsStata(string scalar line, real scalar strict, 
        real scalar echo, string scalar lang) {
 // line starts Stata code using strict or relaxed syntax, or R code
        string scalar next
        real scalar slash
        echo = 1
        lang = "s"
        if(!strict) {
                return(isIndented(line))
        }
        else { 
                // ```s/ or ```m/ or ```r/ for no echo          
                if(!startsWith(line, "```")) return(0)
                next = ustrtrim(usubstr(line, 4, .))
                if (ustrregexm(next, "^\{(.+)\}$") > 0) next = ustrregexs(1)
                slash = usubstr(next, ustrlen(next), 1) == "/"
                if(slash) next = usubstr(next, 1, ustrlen(next) - 1)
                match = ustrregexm(next,"^[smr]$") | next == "stata" | next == "mata"
                if(!match) return(0)
                if(slash) echo = 0
                lang = usubstr(next, 1, 1)
                return(1)
        }                                       
}
