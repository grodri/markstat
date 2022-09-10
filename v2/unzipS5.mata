void unzipS5() {
 // unzip S5 files from archive in ADOPLUS/m
        string scalar home, wd, zip
        home = pathjoin(c("sysdir_plus"), "m")
        zip = pathjoin(home, "markstats5.zip")  
        if(!fileexists(zip)) return
        wd = pwd()
        chdir(home)
        stata("quietly unzipfile markstats5.zip, replace")
        chdir(wd)
        unlink(zip)
}
