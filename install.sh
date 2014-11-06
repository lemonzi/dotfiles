#!/bin/bash

## INSTALL SCRIPT

# cp -r !(.git|install.sh|README.md) ~

rsync -a --exclude-from="exclude" . ~

