{
  pkgs,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    systemd.enable = false;
  };
  xdg.configFile."hypr/hyprland.conf".source = ../../config/hypr/hyprland.conf;
}
