{pkgs, ...}: {
  users.users.gaoutaman = {
    isNormalUser = true;
    description = "Gaoutaman Shanmugam";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };
  users.defaultUserShell = pkgs.zsh;
}
