# Settings

## Vim - .vimrc
* Clone the settings file and move it to an appropriate file. I put mine in `~/Documents`.  
    `cd ~/Documents/ && git clone https://github.com/llipio/DevSettings`
* Symlink your home settings to your new location.  
    For vim: `ln -s ~/Documents/DevSettings/.vimrc ~/.vimrc`
* Install Vundle: `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`  
* Install Silver Searcher: `https://github.com/ggreer/the_silver_searcher`  
    For OSX: `brew install the_silver_searcher`
* Install fuzzy finder: https://github.com/junegunn/fzf
* Install Tmux: `brew install tmux`  
    http://fideloper.com/mac-vim-tmux
```bash
brew install fzf

# Install shell extensions
/usr/local/opt/fzf/Install
```

## Bashprofile
* Add to your bash profile: `vim ~/.bash_profile`  
```bash
if [ -f ~/.devBash ]; then
  source ~/.devBash
fi
```
* Symlink devBash to this location: `ln -s ~/Documents/DevSettings/.devBash ~/.devBash`  
* Refresh: `source ~/.bash_profile`  
