# vim configurations and settings
<p>create symlink for vimrc, where the repo is in ~/.vim:</p>
<pre><code>$ ln -s ~/.vim/vimrc ~/.vimrc</code></pre>
<p>get submodules</p>
<pre><code>$ git submodule init
$ git submodule update</code></pre>
<p>install YouCompleteMe (requires vim >= 7.4 with python support)</p>
<pre><code>$ cd bundle/YouCompleteMe
$ ./install.sh [--clang-completer]</code></pre>
<p>Generating vim help tags</p>
<pre><code>$ vim
:helptags bundle/</code></pre>
<p>Generating (exuberant) ctags for ycm</p>
<pre><code>$ ctags -R --fields=+l ./*</code></pre>
<p>Or</p>
<pre><code>$ alias myctags="ctags -R --fields=+l"</code></pre>
