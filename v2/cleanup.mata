void cleanup(string scalar filename, string scalar keep) {
 // remove intermediate files in list except for keep
        real scalar i
        real vector ri
        string scalar fullname
        string vector remove, list
        remove = "do",  "R",   "md",  "tex", "pdx", "log", 
                     "aux", "nav", "out", "snm", "toc", "vrb", "err"
        list = "stmd"
        if (keep != "") {
                list = list, tokens(ustrlower(keep))
                ri = selectindex(list :== "r")
                if(length(ri) > 0) list[ri] = "R"
        }
        for(i = 1; i <= length(remove); i++) {
                if(length(selectindex(list :== remove[i])) > 0) continue
                fullname = filename + "." + remove[i]
                if(fileexists(fullname)) unlink(fullname)
        }       
}
