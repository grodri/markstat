Mata Matters
------------

Stata/Markdown documents may include Mata code as part of a Stata block
using the simple or strict syntax. It is even possible to start a Mata
session in one block, add a few comments or annotations, and end the
session in another block.

Version 1.6 of `markstat` makes this even easier by extending the strict
syntax to allow Mata blocks as well as inline Mata code. In both cases
you simply use an `m` instead of an `s` in the code fence or inline
code.

I thought it would be fun to try to reproduce part of one of Bill
Gould\'s *Mata Matters* columns, and I picked an excerpt from his column
on subscripts. Here is the code. We start with a quiet block to enter
the matrix **X**, and then take up the narrative from the article.

::: {style="text-align:right"}
`mataMatters.stmd`
:::

```` {.stata}
# Matta Matters (excerpt)

From W. Gould (2007). Mata Matters: Subscripting. *The Stata Journal*,
__7__(1):106-116. <https://www.stata-journal.com/article.html?article=pr0028>.

```s/
    clear mata
    version 11
    mata:
        X = 4,  7, 9 \   
            2, 12, 3 \ 
            8,  8, 7 \  
            3,  4, 1 \  
            1,  7, 9 
    end
```

This is a case of something difficult to program in Stata being trivial
in Mata.  The following example is well worth understanding.

```m
    X
    uniformseed(39483)
    o = ceil(5*uniform(5,1))
    o
    Z = X[o,]
    Z
```

Below I use these ideas to perform a bootstrap of the regression of mpg on weight
and foreign, using the automobile data:

```s
    sysuse auto, clear
    mata:
        st_view(datay=., ., "mpg")
        st_view(dataX=., ., tokens("weight foreign"))
        n = rows(datay)
        dataX = dataX, J(n, 1, 1)
        N = 10000 // number of replications
        uniformseed(47686)
        b = J(N, 3, .)
        for (i = 1; i <= N; i++) {
            o = ceil(n*uniform(n,1))
            y = datay[o,]
            X = dataX[o,]
            b[i,] = (invsym(X'X)*X'y)'
        }
        variance(b)
    end
```

These results are similar to those that would be produced in Stata by typing 
`estat vce` after `bootstrap, reps(10000): regress mpg weight foreign`.
````

You can see the corresponding [HTML](/stata/markdown/mataMatters.html)
and [PDF](/stata/markdown/mataMatters.pdf) output, or even better, you
could run it yourself using the commands:

    copy https://data.princeton.edu/stata/markdown/matamatters.stmd matamatters.stmd
    markstat using matamatters, strict

You may want to compare the output with the original *Stata Journal*
article [available
here](https://www.stata-journal.com/article.html?article=pr0028).

When I first ran this script the results differed from the published
output, even though the seed was the same. I thought something might
have changed with Stata since the paper was written, and added a
`version 11` statement. The results then matched exactly. And of course,
the document was updated without the need to cut and paste anything.
