export ZSH_THEME=noel
export EDITOR=emacs
export ANDROID_HOME=/usr/local/opt/android-sdk
export PATH=/Applications/Emacs.app/Contents/MacOS:$PATH:/Users/noel/.local/bin

alias sl=ls
alias weather='curl wttr.in/London'

function tab() {
    open -a "Google Chrome" http://$1
}
