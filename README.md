# vim configurations and settings
<p>Installation (requires vim >= 7.4 with Python support)</p>
<pre><code>$ ./install.sh</code></pre>
<p>Generating vim help tags</p>
<pre><code>$ vim
:helptags bundle/</code></pre>
<p>Generating (exuberant) ctags for ycm</p>
<pre><code>$ alias myctags="ctags -R --fields=+l"</code></pre>
