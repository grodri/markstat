void texify(string vector lines, real scalar bot, real scalar top) {
 // convert R log to TeX
        string vector escape, code
        string scalar line
        real scalar i, j
        escape = "\", "#", "&", "{", "}", "^", "~", "{\lbr."
        code   = "\\","\#", "\&", "{\lbr.","{\rbr}","{\caret}","{\tytilde}", "{\lbr}"
        for(i = bot; i <= top; i++) {
                line = lines[i]
                if (ustrtrim(line) == "") line = "{\smallskip}"
                else {
                        for(j = 1; j <= length(escape); j++) {
                                line = usubinstr(line, escape[j], code[j], .)
                        }
                }
                lines[i] = line
        }
}
