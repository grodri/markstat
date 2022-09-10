program _runr
* run R
        args filename
        whereis R
        capture erase "`filename'.err"
        local cmd `" "`r(R)'" --vanilla < "`filename'.R" > "`filename'.rout" 2> "`filename'.err" "'             
        shell `cmd'
        mata: checkRout("`filename'")
end
