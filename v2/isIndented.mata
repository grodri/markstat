real scalar isIndented(string scalar line) {
 // line starts with four spaces after detab
        if(ustrtrim(line) == "") return(0)
        return(startsWith(line, "    "))
}
