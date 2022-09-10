string scalar addSuffix(string scalar name, string scalar suffix) {
 // add file extension if not there
        return(pathsuffix(name) == "" ? name + suffix : name)
}
