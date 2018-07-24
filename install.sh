# Set up ZSH
cp -R ~/git/dotfiles/zsh/* ~/.oh-my-zsh/custom

# Set up Emacs
rm -rf ~/.emacs.d
ln -s ~/git/dotfiles/emacs.d/ ~/.emacs.d
