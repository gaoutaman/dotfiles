# dotfiles
NixOS/Hyprland

### neovim
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

### things to setup as needed
- postgres
- docker/docker-compose/lazydocker/podman
- mimeApps
- lazygit/delta
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
fd
fzf
yazi
bat
vim motions
git
ripgrep
wl-clipboard/cliphist
wezterm
direnv
neovim
