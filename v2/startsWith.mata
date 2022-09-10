real scalar startsWith(string scalar line, string scalar stem) {
 // check if beginning of string matches a stem
        real scalar m, r
        m = ustrlen(stem)
        r = usubstr(line, 1, m) == stem
        return(r)
}
