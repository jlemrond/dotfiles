# Setup Iterm for Neovim

[Configure CMD Keybinds](https://www.youtube.com/watch?v=zoDIbZTro6w)

Must be set for each profile you use.

Open Settings > Profiles > Keys > Keybindings

Add a new keybind and set it to "Sent Text with "vim" keybinds"

Map CMD+S to `\e:w\n`
Map CMD+P to `\e:Telescope find_files\n`

Note: \e is escape, \n is Enter (newline)
