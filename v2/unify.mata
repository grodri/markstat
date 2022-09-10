void unify(string vector lines, real scalar bot, real scalar top, string scalar ws) {
 // unify multiple blank lines in output
        real scalar isws, inws, i, j    
        j = bot - 1
        inws = 1
        for(i = bot; i <= top; i++) {
                line = ustrtrim(lines[i])
                isws = line == ""
                if(!isws & ws != "") isws = line == ws
                if(!isws || (isws && !inws)) {
                        j++
                        if(j < i) lines[j] = lines[i]
                        inws = isws
                }
        }
        top = j
}
