{
  config,
  pkgs,
  ...
}: {
  home.username = "gaoutaman";
  home.homeDirectory = "/home/gaoutaman";
  home.stateVersion = "24.11"; # Please read the comment before changing.
  programs.home-manager.enable = true;
  imports = [
    ./browser.nix
    ./hyprland.nix
    ./terminal.nix
  ];
}
