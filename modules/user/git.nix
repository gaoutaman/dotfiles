{...}: {
  programs.git = {
    enable = true;
    userName = "Gaoutaman Shanmugam";
    userEmail = "g.man.9931@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      merge.conflictstyle = "diff3";
    };
  };
}
