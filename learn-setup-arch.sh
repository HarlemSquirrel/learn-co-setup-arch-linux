#!/bin/bash

### Setup a dev environment for Learn.co on Arch Linux by HarlemSquirrel
# https://github.com/HarlemSquirrel/learn-co-setup-arch-linux

set -e  # Exit on errors

printf " Starting setup...\n"

printf " Installing prerequisits...\n"
sudo pacman -S git postgresql nodejs phantomjs chromium redis jdk8-openjdk icedtea-web java-openjfx


#
## --- Pick rbenv OR rvm but DO not use both ruby version managers ---
#

### -- Use rbenv
### https://github.com/rbenv/rbenv
#printf " installing rbenv...\n"
#printf " downloading from AUR...\n"
#wget -N -P ~/Downloads/ https://aur.archlinux.org/cgit/aur.git/snapshot/rbenv.tar.gz
#wget -N -P ~/Downloads/ https://aur.archlinux.org/cgit/aur.git/snapshot/ruby-build.tar.gz

#printf " extracting to /builds dir...\n"
#[ -e ~/builds ] || mkdir ~/builds
#tar -xuf ~/Downloads/rbenv.tar.gz -C ~/builds
#tar -xuf ~/Downloads/ruby-build.tar.gz -C ~/builds

#cd ~/builds/rbenv && makepkg -si
#cd ~/builds/ruby-build && makepkg -si

#printf " setting up path.../n"
#echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
#echo 'eval "$(rbenv init -)"' >> ~/.bashrc
#echo 'PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"' >> ~/.bashrc

#printf " installing and setting ruby 2.2.4...\n"
#rbenv install 2.2.4
#rbenv local 2.2.4


### -- Use RVM
### https://rvm.io/
printf " installing rvm...\n"
cd ~
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable

printf " installing ruby 2.3.1 and setting as default...\n"
rvm install 2.3.1 --default


### -- Install npm to use as local user without sudo
### https://github.com/npm/npm
printf " installing npm...\n"
curl -L https://www.npmjs.com/install.sh | sh


printf " setting rspec to run in color...\n"
echo "--color" > ~/.rspec

printf " installing learn-co gem...\n"
gem install learn-co

printf " creating fake MacOS directories and creating symbolic link to Google Chrome for chromium...\n"
sudo mkdir -p "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
sudo ln -s /usr/bin/chromium "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

printf " installing some npm stuff...\n"
npm install -g karma-cli
npm install -g protractor

printf " Done! You will probably want the Atom editor from https://aur.archlinux.org/packages/atom-editor/ \n"
