---
layout: default
section: examples
---

Bundled Images
--------------

This is exactly the same script as [Simple Script](simpleScript), but we
use the `bundle` option to include the image. To avoid overwriting the
other example, I first copied the script to `auto2.stmd` and then ran
`markstat using auto2`. The result is [here](auto2.html) and is shown
below. If you choose view frame source on your browser you will see that
the image is embedded using base 64 encoding.

<div class="text-end"><code>auto2.html</code></div>
<iframe id="frame" src="auto2.html" width="100%" scrolling="no" class="border mb-3">
</iframe>

This option is not used for `pdf` or `docx` output, nor for `slides` or
`beamer`, as those files always embed the images.

<script>
{% include_relative iframe.js %}
</script>
