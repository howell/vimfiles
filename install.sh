#!/bin/sh
echo "Linking configuration files"
if [ -f "$HOME/.vimrc"]
then
    echo "copying old vimrc to $HOME/vimrc.bak"
    mv $HOME/.vimrc $HOME/vimrc.bak
fi
ln -s vimrc $HOME/.vimrc

if [ -f "$HOME/.gvimrc"]
then
    echo "copying old gvimrc to $HOME/gvimrc.bak"
    mv $HOME/.gvimrc $HOME/gvimrc.bak
fi
ln -s gvimrc $HOME/.gvimrc

echo "Installing submodules"
git submodule init
git submodule update --recursive

pushd .

echo "Installing YouCompleteMe"
cd bundle/YouCompleteMe
./install.sh --clang-completer

echo "Installing vimproc"
cd ../vimproc.vim
make

echo "Installing ghc-mod"
cd ../ghcmod-vim
./install-deps.sh
cd vimproc
make

popd
