real scalar hasInlineCode(string scalar line, string scalar match, string scalar prefix) {
 // non-greedy regex for inline code
        real scalar r, pos, ns, i
        real vector stack
        string scalar pattern, shorter, here

        // greedy match
        pattern = "`([smr]) (.+)`"
        r = ustrregexm(line, pattern)
        if(r <= 0) return(0)
        prefix = ustrregexs(1)
        match  = ustrregexs(2)
        pos = ustrpos(match, "`")
        if(pos < 1) return(1)
        
        // less greedy
        r = ustrregexm(match, "`[smr] ")
        if(r > 0) {
                pos = ustrpos(match, ustrregexs(0))
                shorter = "`" + prefix + " " + usubstr(match, 1, pos - 1)
                r = ustrregexm(shorter, pattern)
                if (r < 1) return(0)
                match = ustrregexs(2)
                pos = ustrpos(match, "`")
                if(pos < 1) return(1)
        }
        
        // allow pairs
        stack = J(24, 1, 0)
        ns = 0
        for(i = 1; i <= ustrlen(match); i++) {
                here = usubstr(match, i, 1)
                if(here == "`") {                               
                        stack[++ns] = i // push
                }
                else if (here == "'" && ns > 0) {
                        ns-- // pop
                }
        }
        if(ns > 0) {
                pos = stack[1]
                match = substr(match, 1, pos - 1)
        }
        return(1)               
}
