dotfiles
========

This is a repository with my dotfiles, for easy replication on linux servers.
Most of it should work on OSX, but I have to re-check it. On `.gitconfig`,
[helper] is now commented. Uncomment it on OSX for automatic github login.

It currently just copies everything to `~`. On update, just run the installer
again. No easy way of updating the repo is provided.

Usage:

```bash
git clone https://github.com/lemonzi/dotfiles ~/.dotfiles
cd ~./.dotfiles
./install.sh
````

TODO
----

Hopefully all these will get done during my next full reset, scheduled for August 
as Yosemite seems stable enough already.

* Add Sublime Text configuration (or get rid of it and just use vim)
* Add custom OSX configuration (`.osx`)

