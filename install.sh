# Set up ZSH
ln -fs ~/git/dotfiles/zsh/noel.zsh ~/.oh-my-zsh/custom/
ln -fs ~/git/dotfiles/zsh/themes/noel.zsh-theme ~/.oh-my-zsh/custom/themes/

# Set up Emacs
rm -rf ~/.emacs.d
ln -s ~/git/dotfiles/emacs.d/ ~/.emacs.d

# Git config
ln -fs ~/git/dotfiles/gitconfig ~/.gitconfig
