{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wget
    curl
    alejandra
  ];
  programs = {
    git.enable = true;
    vim.enable = true;
    zsh.enable = true;
  };
}
