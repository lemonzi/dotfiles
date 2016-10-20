dotfiles
========

This is a repository with my dotfiles, for easy replication on UNIX machines.
The `master` branch is meant to run on linux servers, and `osx` helps with my
laptop workstations.

Not automated yet:

- Code-signing the GDB certificate.
- Setting bash as a login shell (edit /etc/shells).
- Setting bash as the default shell for Terminal.app
- Setting the default search engine for Chrome + logins

Usage:

```bash
git clone https://github.com/lemonzi/dotfiles ~/dotfiles
cd ~/dotfiles
./install.sh
```
