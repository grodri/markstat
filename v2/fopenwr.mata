real scalar fopenwr(string scalar filename) {
 // file open write with replace
        if(fileexists(filename)) unlink(filename)
        return(fopen(filename, "w"))
}
