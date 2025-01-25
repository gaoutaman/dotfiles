{
  inputs,
  pkgs,
  ...
}: {
  nix = {
    settings = {
      trusted-users = ["@wheel"];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://wezterm.cachix.org"
        "https://hyprland.cachix.org"
      ];
      trusted-public-keys = [
        "wezterm.cachix.org-1:kAbhjYUC9qvblTE+s7S+kl5XM1zVa4skO+E/1IDWdH0="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };
  };
}
