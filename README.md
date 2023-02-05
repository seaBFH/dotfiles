# dotfiles

WIP

## Installation

```
# install packages(brew,stow,nvim,ranger,fzf,rg,python3,git,xclip,nodejs(npm),yarn,ghq,exa,peco,jq, pandoc...)
# TDOO:use scripts

# install rust
# rustup (instead of brew)

# install required fonts(Nerd Font BlexFont) <https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/IBMPlexMono>
# Dont use offical IBM Plex which is not a NerdFont

# install zsh-suggestion plugin

# cp zshrc(overwrite)
# can not add soft link to ~/.zshrc directly
# ENV $ZSH do not support ~/.oh-my-zsh
cp ./zsh/dotzshrc ~/.zshrc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# change $ZSH to absolute path

# install vim-plug first

# link vimconfig to .vimrc(init.vim)
ln -s ./nvim/init.vim ~/.vimrc
ln -s ./nvim/init.vim ~/.config/nvim/init.vim
ln -s ./nvim/coc-settings.json ~/.config/nvim/coc-settings.json

# link alacritty config
ln -s ./alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

# link ranger config

# link tmux config
ln -s ./tmux-config/dottmux.conf ~/.tmux.conf

# install vim Plugins using vundle
nvim +PluginInstall +qall
# install go tools for vim-go
:GoInstallBinaries
# install coc plugins
:CocInstall coc-go coc-python coc-markdownlint coc-rls coc-json
# ranger devicons2 doesnt work well without nerd fonts(or any other fonts with icons)
```

## TODOs

- scripts for installation [x]
- stow scripts for linux []
- ansible scripts []
- style.css for markdown-preview
