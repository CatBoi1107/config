#!/bin/sh
kitty -e "tmux && exit" &
disown
