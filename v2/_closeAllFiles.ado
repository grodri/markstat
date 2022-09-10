program _closeAllFiles
        forvalues i = 0(1)12 {
                capture mata: fclose(`i')
        }
end
