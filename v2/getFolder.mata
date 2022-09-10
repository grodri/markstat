string scalar getFolder(string path) {
 // extract folder from path
        string scalar r
        pathsplit(path, r = "", J(0,0,""))
        return(r)
}
