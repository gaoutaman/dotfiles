{pkgs, ...}: {
  home.packages = with pkgs; [swayosd];
  xdg.configFile."swayosd/style.css".source = ../../config/swayosd/style.css;
}
