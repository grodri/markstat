real scalar startsBlock(string scalar line) {
 // line is a code fence or display math opener
        if(ustrtrim(line) == "$$") return(1)
        return(startsWith(line, "```") || startsWith(line, "~~~"))
}
