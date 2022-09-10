string vector htmlEncode(string vector lines, real scalar bot, real scalar top) {
 // encode & and < as entities
        real scalar j
        string vector encoded, fixamp
        encoded = J(top - bot + 1, 1, "")
        for(j = bot; j <= top; j++) {
                fixamp = usubinstr(lines[j], "&", "&amp;", .)
                encoded[j - bot + 1] = usubinstr(fixamp, "<", "&lt;", .)
        }
        return(encoded)
}
