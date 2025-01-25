{
  config,
  pkgs,
  ...
}: {
  boot = {
    loader = {
      systemd-boot.enable = true; # bootloader
      systemd-boot.configurationLimit = 10; # no. of bootloader configs
      efi.canTouchEfiVariables = true; # nix can edit Efi variables
      efi.efiSysMountPoint = "/boot";
    };
    kernelPackages = pkgs.linuxPackages_latest; # latest linux kernel from nix
    blacklistedKernelModules = ["elan_i2c"]; # allows my lenovo touchpad to work
    plymouth = {
      enable = true;
      themePackages = [pkgs.catppuccin-plymouth];
      theme = "catppuccin-macchiato";
    };
  };
}
