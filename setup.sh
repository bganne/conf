#!/bin/bash
set -eu
FILES="gdbinit gitconfig gitignore inputrc screenrc vim vimrc"
MYDIR="$(dirname "$0")"
for f in $FILES; do
    ln -vrs "$@" "$MYDIR/$f" "$HOME/.$f"
done
