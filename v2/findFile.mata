string scalar findFile(string scalar name) {
 // look for ancillary file in working directory or markstat folder
        string scalar folder, wd
        folder = "."
        if(findfile(name, "./") == "") {
                folder = getFolder(findfile("markstat.ado"))
                if (c("os") == "Windows") folder = usubinstr(folder, "\", "/", .)
                else if(usubstr(folder, 1, 1) == "~") {
                        wd = pwd()
                        chdir("")
                        folder = pathjoin(pwd(), usubstr(folder,2, .))
                        chdir(wd)
                }
        }
        return(folder + "/" + name)
}
