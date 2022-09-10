---
layout: default
section: examples
---

Stata and R Tabs with Bootstrap
-------------------------------

When I prepare computer logs for my statistics courses, I usually
show how to do things in Stata and R, so students have a choice of 
software. With the latest additions to `markstat`, I can now do this
much more easily.

Here I have revisited a page describing Cox regression models. The links
below show the script and the resulting page, but you may want to read
the explanation first. 

- [Markstat](cox.stmd)
- [HTML](cox.html)

Header Includes
---------------

The first thing to notice is that I use the Bootstrap framework. The
easiest way to do this is to use "header-includes" to link to the
necessary CSS and JavaScript files from a content distribution network
(CDN). That's why the script starts with

<pre>
---
title: Cox Regression
author: Germán Rodríguez
date: 12 December 2017
header-includes:
 - &lt;link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"/>
 - &lt;script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
 - &lt;script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
---
</pre>

Bootstrap Tabs
--------------

The main use of the framework is to use tabs to show Stata and R
versions of the page. This is actually quite easy to do. Before the very
first bit of code, include the following HTML

```
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" href="#stata">Stata</a></li>
<li><a data-toggle="tab" href="#r">&nbsp; R &nbsp;</a></li>
</ul>
<p></p>   
```

Then, of course, you need to provide some code to switch from one
language to the other. Simply include the following JavaScript at the
end of your page

```
<script>
$(function () {
    $(".r").hide();
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        var href = $(e.target).attr("href")
        var language = href.substr(1);
        var other = language == 'r' ? 'stata' : 'r';
        $("." + other).hide();
        $("." + language).show();
    });
})
</script>
```

I just lifted these two fragments from a course page, where they have
been in use for a long time. The only change is the use of `stata` and
`r` classes here. These bits can be saved in separate files and injected
using `.include`. This is all you need for the tabs to work.

Text
----

Sometimes, however, we need to include language-specific text. This we
obtain for free if we simply assign the class `r` or `stata` to text
that should appear only for that language, for example after fitting a
proportional hazards model I note

```
[Stata reports hazard ratios unless you specify the option `nohr`.]{.stata}
[R reports log-relative risks, but also exponentiates the coefficients to obtain
hazard ratios.]{.r}
```

This provides the right description for each language. The script also
has a `div` discussing `tvc()` and `tvexp()`, which of course applies
only to Stata.

Figures
-------

This trick also works for images. If you want to include a Stata graph
just add the `stata` class to the image. Do the same for R. I usually
just add an `r` to the name of an R plot. For example the main
Cox-Kaplan-Meier plot is called `coxkm.png` in the Stata version and
`coxkmr.png` in the R version. To show these I coded

```
![](coxkm.png){width="5in" .stata}
![](coxkmr.png){width="5in" .r}
```

Each plot will show only when the corresponding tab is selected.

If an image is in a paragraph by itself and has a caption, Pandoc will
wrap it in `<figure>` tags and add a `<figcaption>`. To ensure that all
elements are shown or hidden you need to wrap the image using colon
fences and assign the language class to that:

```
:::{.stata}
![An Implicit Figure](coxkm.png){width="5in"}
:::
```

I did not use this technique in this example, as none of the images have
Markdown captions. Instead, I added a CSS rule so all images would be
centered.

By the way, if you are wondering how I got the Stata plots to look like
R\'s `ggplot2`, read about the `plottig` scheme in the *Stata Journal*
17-3 or type `search plottig`. And if you are wondering how I got
generic grid plots in R to look somewhat like `ggplot2`, look at the
`ggfy()` function in a quiet R block near the top of the script.

That\'s it, really. Follow the links at the top to see the script and
the resulting web page, which differs from the \"official\" page only on
the surrounding \"chrome\".

New in `markstat` 2.1
