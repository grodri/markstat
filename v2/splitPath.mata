void splitPath(string scalar filename) {
 // returns folder, file and suffix in locals, sets isurl 
        string scalar path, file
        pathsplit(filename, path = "", file = "")
        if(pathisurl(path)) {
                st_local("isurl", "isurl")
        }
        if (c("os") == "Windows") path = usubinstr(path, "/", "\",.)
        st_local("folder", path)
        st_local("file", pathrmsuffix(file))
        st_local("suffix", pathsuffix(file))    
}       
