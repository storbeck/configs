#!/usr/bin/env fish

set script (status --curent-filename)
set repo_dir (cd (dirname "$script"); and pwd)

ln -sf "$repo_dir/wezterm.lua" "$HOME/.wezterm.lua"
