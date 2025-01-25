{pkgs, ...}: {
  home.packages = with pkgs; [hyprshade];

  xdg.configFile."hypr/hyprshade.toml".source = ../../config/hypr/hyprshade.toml;
}
