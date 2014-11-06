#!/bin/bash

## INSTALL SCRIPT

# cp -r !(.git|install.sh|README.md) ~
rsync -a . ~ --exclude=".git" --exclude="README.md" --exclude="install.sh" --exclude=".bash_config"

