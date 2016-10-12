dotfiles
========

This is a repository with my dotfiles, for easy replication on UNIX machines.
The `master` branch is meant to run on linux servers, and `osx` helps with my
laptop workstations.

It currently just copies everything to `~`. On update, just run the installer
again. No easy way of updating the repo is provided. Eventually, the idea is
to use symlinks or something like that.

Not automated yet:

- Code-signing the GDB certificate.

Usage:

```bash
git clone https://github.com/lemonzi/dotfiles ~/.dotfiles
cd ~./.dotfiles
./install.sh
```

