void handleUnderline(string scalar line) {
 // use custom-style for underline
        string scalar regex, cstyle
        regex = "<[uU]>([^<]+)<\/[uU]>"
        while( ustrregexm(line, regex) > 0) {
                cstyle = "[" + ustrregexs(1) + `"]{custom-style="Underline"}"'
                line = usubinstr(line, ustrregexs(0), cstyle, 1)
        }
}
