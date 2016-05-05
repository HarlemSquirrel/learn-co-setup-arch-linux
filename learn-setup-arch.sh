#!/bin/bash

### Setup an environment for Learn.co on Arch Linux by HarlemSquirrel

set -e  # Exit on errors

printf " Starting setup...\n"

printf " Installing prerequisits...\n"
pacman -S postgresql nodejs phantomjs chromium redis jdk8-openjdk icedtea-web java-openjfx

printf " downloading from AUR...\n"
wget -N -P ~/Downloads/ https://aur.archlinux.org/cgit/aur.git/snapshot/rbenv.tar.gz
wget -N -P ~/Downloads/ https://aur.archlinux.org/cgit/aur.git/snapshot/ruby-build.tar.gz

printf " extracting to /builds dir...\n"
[ -e ~/builds ] || mkdir ~/builds
tar -xuf ~/Downloads/rbenv.tar.gz -C ~/builds
tar -xuf ~/Downloads/ruby-build.tar.gz -C ~/builds

printf " making and installing AUR packages(will need admin password)...\n"
cd ~/builds/rbenv && makepkg -si
cd ~/builds/ruby-build && makepkg -si

printf " setting up path.../n"
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
echo 'PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"' >> ~/.bashrc

printf " installing and setting ruby 2.2.4...\n"
rbenv install 2.2.4
rbenv local 2.2.4

printf " setting rspec to run in color...\n"
echo "--color" > ~/.rspec

printf " installing learn-co gem...\n"
gem install learn-co

printf " creating fake MacOS directories and creating symbolic link to Google Chrome for chromium...\n"
sudo mkdir -p "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
sudo ln -s /usr/bin/chromium "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

printf " installing some npm stuff...\n"
sudo npm install -g karma-cli
sudo npm install -g protractor

printf " Done! You will probably want the Atom editor from https://aur.archlinux.org/packages/atom-editor/ \n"
