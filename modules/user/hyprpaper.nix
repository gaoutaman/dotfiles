{...}: {
  services.hyprpaper = {
    enable = true;
  };
  xdg.configFile."hypr/hyprpaper.conf".source = ../../config/hypr/hyprpaper.conf;
}
