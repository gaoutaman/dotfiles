{pkgs, ...}: {
  programs.firefox = {
    enable = true;
    profiles.gaoutaman = {
    };
  };
}
