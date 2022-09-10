# Combine Markdown and Stata with `markstat`

This depository has the source code and documentation for `markstat`,
a command to produce dynamic documents with Markdown and Stata,
currently at version 2.7 released 2 june 2021.

Detailed documentation for the command is available in the docs
section, which you can browse at <https://grodri.github.io/markstat>.

You can install this command from the Statistical Software Components
(SSC) archive typing in Stata

```
ssc install markstat
```

The source code has each Stata subcommand in a separate `.ado` file
and each Mata function in a separate `.mata` file, to facilitate
testing and debugging.  

There is also a *manifest* file called `markstat.mkm` that lists all 
the components. The `mkado` command uses this manifest to collate
all the files into `markstat.ado`.



