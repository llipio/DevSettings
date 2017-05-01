# Settings

## Vim - .vimrc
* Clone the settings file and move it to an appropriate file. I put mine in `~/Documents`.  
    `cd ~/Documents/ && git clone https://github.com/llipio/DevSettings`
* Symlink your home settings to your new location.  
    For vim: `ln -s ~/Documents/DevSettings/.vimrc ~/.vimrc`
* Install [Vundle](https://github.com/VundleVim/Vundle.vim): `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`  
* Install [Silver Searcher](https://github.com/ggreer/the_silver_searcher): `brew install the_silver_searcher`  
* Install [fuzzy finder](https://github.com/junegunn/fzf): `brew install fzf`
* Install [Tmux](http://fideloper.com/mac-vim-tmux): `brew install tmux`  
    Setup tmux colors: `echo 'set -g default-terminal "screen-256color"' > ~/.tmux.conf`

## Bashprofile
* Add to your bash profile: `vim ~/.bash_profile`  or `vim ~/.bashrc`
```bash
if [ -f ~/.devBash ]; then
  source ~/.devBash
fi
```
* Symlink devBash to this location: `ln -s ~/Documents/DevSettings/.devBash ~/.devBash`  
* Refresh: `source ~/.bash_profile`  
