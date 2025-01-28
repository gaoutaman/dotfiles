# dotfiles
NixOS/Hyprland
### things to setup as needed
- postgres
- docker/docker-compose/lazydocker/podman
- lazygit/delta
- mimeApps
- fzf settings
    defaultCommand = "fd --hidden --strip-cwd-prefix --exclude .git";
    fileWidgetOptions = [
      "--preview 'if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi'"
    ];
    changeDirWidgetCommand = "fd --type=d --hidden --strip-cwd-prefix --exclude .git";
    changeDirWidgetOptions = [
      "--preview 'eza --tree --color=always {} | head -200'"
    ];
- rofi

### things to learn how to use
git
wezterm
bat
fd
fzf
yazi
ripgrep
direnv
neovim
wl-clipboard/cliphist
