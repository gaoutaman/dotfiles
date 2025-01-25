{...}: {
  programs.wofi = {
    enable = true;
  };
  xdg.configFile."wofi/config".source = ../../config/wofi/config;
}
