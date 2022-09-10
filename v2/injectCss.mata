void injectCss(real scalar outfile) {
 // inject markstat.css wrapping in style tags
        string scalar path
        string vector css
        path = findfile("markstat.css")
        if(path == "") return
        css = cat(path)
        fput(outfile, "<style>")
        fputvec(outfile, css)
        fput(outfile, "</style>")
}
