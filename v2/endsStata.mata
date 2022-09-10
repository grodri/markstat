real scalar endsStata(string scalar line, real scalar strict) {
 // line ends Stata code using relaxed or strict syntax
        if(!strict) {
                return(!isIndented(line))
        }
        else {
                return(startsWith(line, "```"))
        }
}
