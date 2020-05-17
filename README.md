# Dotfiles

## vimrc

For Mac, install MacVim and add the following soft link (otherwise
youcompleteme plugin with segfault):

```
ln -s /Applications/MacVim.app/Contents/bin/vim vim
```

Installing youcompleteme with pathogen:

```
cd ~/.vim/bundle
git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive
./install.sh --clang-completer
```
