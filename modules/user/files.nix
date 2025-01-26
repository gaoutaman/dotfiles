{config, ...}: {
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      music = "${config.home.homeDirectory}/Files/Media/Music";
      videos = "${config.home.homeDirectory}/Files/Media/Videos";
      pictures = "${config.home.homeDirectory}/Files/Media/Pictures";
      download = "${config.home.homeDirectory}/Files/Downloads";
      documents = "${config.home.homeDirectory}/Files/Documents";
      desktop = null;
      publicShare = null;
      templates = null;
      extraConfig = {
        XDG_DOTFILES_DIR = "${config.home.homeDirectory}/.dotfiles";
      };
    };
  };
}
