{...}: {
  home.username = "gaoutaman";
  home.homeDirectory = "/home/gaoutaman";
  home.stateVersion = "24.11"; # Please read the comment before changing.

  programs.home-manager.enable = true;

  services.udiskie.enable = true;

  home.sessionVariables = {
    TERMINAL = "wezterm";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    HYPRSHOT_DIR = "\${HOME}/Media/Pictures/Screenshots";
  };
}
