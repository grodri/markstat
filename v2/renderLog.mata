void renderLog(real scalar outfile, string scalar format, 
    string vector lines, real scalar bot, real scalar top, string scalar lang) {        
 // Trims log snippet and wraps in appropriate environment, 
 // consolidates old log2html and log2tex and handles R
 
        string vector encoded
        string scalar blank, comment
        real scalar trim, tex, beamer, stata
        stata = lang == "stata"
        tex = format == "latex" | format == "beamer"

        // handle removeCommands        
        comment = lang == "stata" ? "//" : "#"
        trim = ustrregexm(lines[bot], comment + "_[0-9]+([mq]+)") > 0
        bot++
        if(trim) removeCommands(lines, bot, top, lang, ustrregexs(1))   
    // remove excess blank lines        
        blank = (tex & stata) ? "{\smallskip}" : ""
    if(trim) unify(lines, bot, top, blank)
        while(top >= bot) {
                if(ustrtrim(lines[top]) != blank) break
                top--
        }
        // empty
        if(top < bot) {
                fput(outfile, "")
        }
        // html 
        else if (format == "html" | format == "s5") {
                encoded = htmlEncode(lines, bot, top)
                fput(outfile, "<pre class='" + lang + "'>" + encoded[1])
                fputvec(outfile, encoded, 2, length(encoded))
                fput(outfile, "</pre>")
        }       
        // latex stlog
        else if (tex) {
                if(!stata) texify(lines, bot, top)
                if(usubstr(lines[bot], 1, 1) == " ") lines[bot] = "\" + lines[bot]
                beamer = format == "beamer"
                if(beamer) fput(outfile, "{\fontsize{7}{8}\selectfont")
                fput(outfile, "\begin{stlog}" + beamer * "[auto]")
                fputvec(outfile, lines, bot, top)
                fput(outfile, "\end{stlog}" + beamer * "}")             
        }
        // docx or markdown
        else {
                fput(outfile, "```" + lang)
                fputvec(outfile, lines, bot, top)
                fput(outfile, "```")
        }       
}
