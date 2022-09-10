---
layout: default
section: examples
---

This is an `egen` extension used as an example in the Programming
section of my Stata Tutorial. Click the button to copy to your
clipboard.

<div class="text-end"><button type="button" class="btn btn-sm btn-primary" 
 data-bs-toggle="tooltip" data-bs-title="Copy to Clipboard" 
 onclick="copyToClipboard('gpnupt')">Copy</button>
 </div>
<pre id="gpnupt">
program define _gpnupt
*! Coale-McNeil cumulative nuptiality schedule v1 GR 24-Feb-06
    version 9.1
    syntax newvarname=/exp [, Mean(real 25) Stdev(real 5) Pem(real 1)]
    if `mean' <= 0 | `stdev' <= 0 | `pem' <= 0 | `pem' > 1 {
        display as error "invalid parameters"
        exit 198
    }
    tempname z g
    gen `z' = (`exp' - `mean')/`stdev'
    gen `g' = gammap(0.604, exp(-1.896 * (`z' + 0.805)))
    gen `typlist' `varlist' = `pem' * (1 - `g') 
end
</pre>

<script>
window.addEventListener("DOMContentLoaded", (event) => {
    const triggers = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    const tooltips = [...triggers].map(element => new bootstrap.Tooltip(element));

})    
    // general, can be included
function copyToClipboard(id) {
    console.log("copyToClipboard")
    const target = document.getElementById(id);
    
    const ta = document.createElement("textarea");
    document.body.appendChild(ta);
    ta.textContent = target.textContent;
    ta.select();
    document.execCommand("copy");
    ta.parentNode.removeChild(ta);
}
</script>