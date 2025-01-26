{
  inputs,
  pkgs,
  ...
}: {
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    packages = with pkgs; [
      font-awesome
      nerd-fonts.fira-code
      nerd-fonts.symbols-only
      noto-fonts-emoji
    ];
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-kde
    ];
  };

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    withUWSM = true;
    xwayland.enable = true;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    autoNumlock = true;
    enableHidpi = true;
    theme = "catppuccin-macchiato";
    package = pkgs.kdePackages.sddm;
    settings.Theme.CursorTheme = "Bibata-Modern-Ice";
  };

  environment.systemPackages = with pkgs; [
    (
      catppuccin-sddm.override {
        flavor = "macchiato";
        font = "FiraCode Nerd Font";
        fontSize = "9";
        background = "${../../wallpaper.jpg}";
        loginBackground = true;
      }
    )
    bibata-cursors # cursor theme
  ];

  imports = [inputs.stylix.nixosModules.stylix];
  stylix = {
    enable = true;
    autoEnable = true;
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
      package = pkgs.bibabta-cursors;
      size = 24;
    };
    opacity = {
      desktop = 0.9;
      terminal = 0.8;
    };
    targets = {
      plymouth.enable = false;
    };
  };
}
