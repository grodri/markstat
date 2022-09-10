void removeCommands(string vector lines, real scalar bot, real scalar top, 
        string scalar lang, string scalar mark) {
 // blocks with q in marker don't echo commands, with m remove mata rules <>
 // now called only for q and m blocks to blank commands, handles R
        real scalar j, iscmd
        string scalar two, pri, sec, cont
        string vector block
        
        // command and continuation prompts
        pri   = lang == "stata" ? ". " : "> "
        sec   = lang == "stata" ? ": " : "> "
        cont  = lang == "stata" ? "> " : "+ "
        
        // mata rules in m              
        if(ustrpos(mark, "m") > 0) {                    
                j = bot \ bot + 1 \ top - 2\ top - 1
                block = lines[j]
                assert(isMataRules(block[1::2]) & isMataRules(block[3::4]))
                lines[j] = J(4, 1, "")
        }
        // commands in q
        if(ustrpos(mark, "q") > 0) {    
                for(j = bot; j <= top; j++) {
                        two = usubstr(lines[j], 1, 2)
                        iscmd = two == pri || two == sec || two == cont                         
                        if(iscmd) {                                     
                                // mata rules in q
                                if (lang == "stata" & j < top) {
                                        if(isMataRules(lines[j\j+1]) ) lines[j + 1] = ""
                                }
                                lines[j] = ""
                        }
                }
        }
}
