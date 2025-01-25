{
  system,
  inputs,
  pkgs,
  ...
}: {
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
  documentation = {
    enable = true;
    doc.enable = false;
    man.enable = true;
    dev.enable = false;
    info.enable = false;
    nixos.enable = false;
  };
  security = {
    rtkit.enable = true;
    sudo.enable = true;
    pam.services.hyprlock = {};
  };

  environment.systemPackages = with pkgs; [
    btop
    acpi # battery
    brightnessctl
    powertop # monitor processes
    duf # A disk usage/availability tool with a user-friendly output
    ncdu # A disk usage analyzer with an ncurses interface.
    lshw # A tool for listing hardware configuration.
    inxi # A command-line system information tool
    playerctl # Media buttons
    udiskie # Automounting media
    pavucontrol # Sound Control
    inputs.hyprpolkit.packages.${system}.default
  ];
  programs = {
    htop.enable = true;
    nix-ld = {
      enable = true;
      # libraries = with pkgs; [
      # ];
    };
    dconf.enable = true; # GNOME config
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    thunar.enable = true;
  };
  services = {
    printing.enable = true; # CUPS printing
    # Network devices
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    dbus.enable = true;
    fstrim.enable = true; # optimise SSD
    udisks2.enable = true; # Auto-mounting
    gnome.gnome-keyring.enable = true; # GNOME
    gvfs.enable = true; # GNOME
    logind.extraConfig = ''
      # don’t shutdown when power button is short-pressed
      HandlePowerKey=ignore
    '';
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
    pulseaudio.enable = false;
    blueman.enable = true; # GUI for managing GUI
    libinput.enable = true; # Enable touchpad support
  };
}
