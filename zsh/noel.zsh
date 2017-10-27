export EDITOR=emacs
export ANDROID_HOME=/usr/local/opt/android-sdk
export PATH=/Applications/Emacs.app/Contents/MacOS:$PATH:/Users/noel/.local/bin

alias sl=ls
alias weather='curl wttr.in/London'

alias docker-rebuild='docker-compose down && docker-compose up --build -d'
alias pgh='psql -h localhost -p 5432 -d habito -U habito'

function tab() {
    open -a "Google Chrome" http://$1
}
