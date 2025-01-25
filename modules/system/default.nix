{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./desktop.nix
    ./nix.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.blacklistedKernelModules = ["elan_i2c"];
  networking.hostName = "X"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };
  console.keyMap = "uk";

  users.users.gaoutaman = {
    isNormalUser = true;
    description = "Gaoutaman Shanmugam";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wget
    curl
    alejandra
  ];
  programs.git.enable = true;
  programs.vim.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "24.11"; # Did you read the comment?
}
