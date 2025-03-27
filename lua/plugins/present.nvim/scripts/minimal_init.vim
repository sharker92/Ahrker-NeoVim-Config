set rtp+=.
set rtp+=../plenary.nvim/
"To make it work locally -> make test
set rtp+=~/.local/share/nvim/lazy/plenary.nvim/

runtime! plugin/plenary.vim
runtime! plugin/load_present.lua

