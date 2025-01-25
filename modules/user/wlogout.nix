{...}: {
  programs.wlogout = {
    enable = true;
  };
  xdg.configFile."wlogout/layout".source = ../../config/wlogout/layout;
}
