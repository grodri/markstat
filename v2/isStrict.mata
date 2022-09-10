real scalar isStrict(string scalar filename) {
 // scans head of file to see if code fences are used
    real scalar fh, result, n, echo
        string scalar EOF, line, state, closer, lang
        result = 0
        n=0     
        closer = ""
        EOF = J(0, 0, "")       
        fh = fopen(filename + ".stmd", "r")
        state = "looking"
        while( (line = fget(fh)) != EOF & n < 50) {
                if(state == "inblock") {
                        if(endsBlock(line, closer)) {
                                state = "looking"
                        }
                }
                else { 
                        if (startsBlock(line)) {
                                if(startsStata(line, 1, echo=0, lang="")) {
                                        result = 1
                                        break
                                }
                                else {
                                        state = "inblock"
                                        closer = blockCloser(line)
                                }
                        }
                }
                n++
        }
        fclose(fh)
        return(result)
}
