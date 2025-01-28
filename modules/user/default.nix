{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./browser.nix
    ./discord.nix
    ./files.nix
    ./git.nix
    ./hypridle.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./hyprshade.nix
    ./packages.nix
    ./style.nix
    ./swaync.nix
    ./terminal.nix
    ./user.nix
    ./waybar.nix
    ./wofi.nix
  ];
}
