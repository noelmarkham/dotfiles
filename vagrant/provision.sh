apt-get update
apt-get install -y git zsh

su - vagrant -c 'sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | grep -v shells)"'

chsh -s /bin/zsh vagrant
