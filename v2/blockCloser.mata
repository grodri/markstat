string scalar blockCloser(string scalar line) {
 // dollars or code fence with at least as many backticks/tildes as opener
        string scalar trimmed, tick
        real scalar n
        trimmed = ustrtrim(line)
        if(usubstr(trimmed, 1, 2) == "$$") return("$$")
        tick = usubstr(trimmed, 1, 1)
        n = indexnot(trimmed, tick) - 1
        if(n < 1) n = ustrlen(trimmed)
        return(n * tick)
}       
