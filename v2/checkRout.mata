void checkRout(string scalar filename) {
 // check that R output includes end-of-script marker           
        real scalar fh, ok
        string scalar line
        fh = fopen(filename + ".rout", "r")
        ok = 0
        while((line = fget(fh)) != J(0, 0, "")) {
                if(usubstr(line, 1, 5) == "> #_^") {
                        ok = 1
                        break;
                }
        }
        fclose(fh)
        if(ok) return
 // inform the user
        errprintf("R run failed\n")
        if(fileexists(filename + ".err")) {
                errprintf("Warning and error messages follow\n")
                stata("type " + filename + ".err")
        }
        exit(197)
}
