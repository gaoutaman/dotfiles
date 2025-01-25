{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.stylix.homeManagerModules.stylix];
  stylix = {
    enable = true;
    autoEnable = false;
    polarity = "dark";
    image = ../../wallpaper.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    fonts = {
      monospace = {
        name = "FiraCode Nerd Font Mono";
        package = pkgs.nerd-fonts.fira-code;
      };
      serif = {
        name = "FiraCode Nerd Font";
        package = pkgs.nerd-fonts.fira-code;
      };
      sansSerif = {
        name = "FiraCode Nerd Font";
        package = pkgs.nerd-fonts.fira-code;
      };
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-emoji;
      };
    };
    cursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
    opacity = {
      desktop = 0.9;
      terminal = 0.8;
    };
    iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
    };
    targets = {
	bat.enable = true;
	btop.enable = true;
	firefox.enable = true;
	firefox.profileNames = [ "gaoutaman" ];
	fzf.enable = true;
	gnome.enable = true;
	gtk.enable = true;
	gtk.flatpakSupport.enable = true;
	hyprland.enable = true;
	hyprlock.enable = true;
	nixcord.enable = true;
	swaync.enable = true;
	vim.enable = true;
	waybar.enable = true;
	wezterm.enable = true;
	wofi.enable = true;
	yazi.enable = true;
	zathura.enable = true;
    };
  };
}
