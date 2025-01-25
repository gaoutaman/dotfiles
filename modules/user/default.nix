{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./browser.nix
    ./files.nix
    ./git.nix
    ./hypridle.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./hyprshade.nix
    ./packages.nix
    ./swaync.nix
    ./swayosd.nix
    ./terminal.nix
    ./user.nix
    ./waybar.nix
./wlogout.nix
    ./wofi.nix
  ];
}
