# Learn Co Setup for Arch Linux
A script to setup a dev environment for Learn Co on [Arch Linux](https://www.archlinux.org).

I created this script while studying full stack web development at [Flatiron School](http://flatironschool.com/) through their [Learn](https://learn.co) platform.

# Disclaimer
I have done very little testing of this script. I mostly used it as reference for packages installed and configurations I set. Please make sure you understand what this script does and back up all of your data before using it. This script should work with Arch Linux and derivatives like Antergos. Arch Linux is a rolling release distribution so there is a slighly increased chance that this script could break at any time. I welcome any feedback and suggestions!

# What does it do?
This script installs git, PostgreSQL, NodeJS, npm, PhantomJS, Chromium, Redis, and OpenJDK. It builds and installs [RVM](https://rvm.io/) (but you could use [rbenv](https://github.com/rbenv/rbenv) and [ruby-build](https://github.com/rbenv/ruby-build) if you uncomment that section, just don't use both) for managing ruby versions. It setups up path, installs ruby 2.2.4 and then sets it to default. It enables color for [RSpec](https://github.com/dchelimsky/rspec) output and installs the [learn-co](https://github.com/learn-co/learn-co) gem which is CLI to Learn.co. It creates fake Mac OS directories and a sym link to Google Chrome for Chromium to allow browser-based tests in the laster JavsScript units to work properly in Chromium. It also installs mocha, karma-cli and protractor using npm.

# What does it NOT do?
This script does not install the `base`, `base-devel`, or any desktop environments for Arch Linux. Arch Linux is very much a do-it-yourself distro and so you will likely need other software if you are running a basic install: see the [beginners' guide](https://wiki.archlinux.org/index.php/Beginners'_guide).  It does not install a text editor but there is a suggestion at the end to install my new favorite text editor, [Atom](https://atom.io/), with a link to the AUR repository.

# Usage
You will need an internet connection and the `base-devel` package installed. Then, just run the script with
```sh
bash learn-setup-arch.sh
```
You could download the script and run it in one fell swoop.
```sh
curl -L https://raw.githubusercontent.com/HarlemSquirrel/learn-co-setup-arch-linux/master/learn-setup-arch.sh | sh
```
