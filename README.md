# vim configurations and settings
<p>create symlink for vimrc, where the repo is in ~/.vim:</p>
<pre><code>$ ln -s ~/.vim/vimrc ~/.vimrc</code></pre>
<p>get submodules</p>
<pre><code>
$ git submodule init
$ git submodule update</code></pre>
<p>Generating (exuberant) ctags for ycm</p>
<pre><code>$ ctags -R --fields=+l ./*</code></pre>
