# Learn Co Setup for Arch Linux
A script to setup a dev environment for Learn Co on Arch Linux

I created this script while studying full stack web development at [Flatiron School](http://flatironschool.com/) through their [Learn](https://learn.co) platform. 

# Disclaimer
I have done very little testing of this script. I mostly used it as reference for packages installed and configurations I set. Please make sure you understand what this script does and back up all of your data before using it. I welcome any feedback and suggestions!

# What does it do?
This script installs git, PostgreSQL, NodeJS, npm, PhantomJS, Chromium, Redis, and OpenJDK. It builds and installs [rbenv](https://github.com/rbenv/rbenv) and [ruby-build](https://github.com/rbenv/ruby-build) for managaing ruby versions. It setups up path, installs ruby 2.2.4 and then sets it to default. It enables color for [RSpec](https://github.com/dchelimsky/rspec) output and installs the [learn-co](https://github.com/learn-co/learn-co) gem which is CLI to Learn.co. It creates fake Mac OS directories and a sym link to Google Chrome for Chromium to allow browser-based tests in the laster JavsScript units to work properly in Chromium. It also installs the karma-cli and protractor using npm. 

# Usage
You will need an internet connection and the `base-devel` package installed. Then, just run the script with
```
bash learn-setup-arch.sh
```
