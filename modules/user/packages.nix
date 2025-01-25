{pkgs, ...}: {
  home.packages = with pkgs; [
    jq
    ripgrep
    ripgrep-all # grep replacement
    zip
    unzip
    wl-clipboard
    wl-clip-persist
    cliphist
    ffmpeg
    wayland
    wf-recorder
    qalculate-gtk # calculator
    # Media
    gimp
    imv # Images
    mpv # Videos
    vlc
    tdf # cli pdf viewer
    zathura
    # Hypr
    hyprshot # screenshot
    # Programs
    obsidian
    libreoffice
    # Dev
    libgcc
    uv
    gnumake
  ];
}
