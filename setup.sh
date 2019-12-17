#!/bin/bash
set -eu
FILES="gdbinit gitconfig gitignore inputrc profile screenrc vim vimrc"
MYDIR="$(dirname "$0")"
for f in $FILES; do
    ln -fTvrs "$@" "$MYDIR/$f" "$HOME/.$f"
done
