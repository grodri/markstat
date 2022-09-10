real scalar isMataRules(string vector lines) {
 // check for mata: and end (now working with translated log)
    string scalar cmd, dashes
        real scalar hasRule
        dashes = "─" * 4
        hasRule = startsWith(lines[2], "\HLI{") | 
                startsWith(lines[2], dashes) |  startsWith(lines[2], "---" )
        if(!hasRule) return(0)
        cmd = ustrtrim(lines[1])
        return(cmd == ". mata" | cmd == ". mata:" | cmd == ": end")     
}
