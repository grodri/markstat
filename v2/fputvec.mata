void fputvec(real scalar fh, string vector lines, | real scalar bot, real scalar top) {
 // write string array to file
        real scalar i
        if (args() < 4) { 
                bot = 1; 
                top = length(lines);
        }
        for(i = bot; i <= top; i++) {
                fput(fh, lines[i])
        }
}
