{
  inputs,
  pkgs,
  config,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    dotDir = ".config/zsh";
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history = {
      extended = true;
      path = "${config.xdg.dataHome}/zsh/zsh_history";
      ignoreAllDups = true;
    };
    initExtra = ''
      eval "$(uv generate-shell-completion zsh)"
      eval "$(uvx --generate-shell-completion zsh)"
    '';
    envExtra = ''
      export PATH="/home/gaoutaman/.local/share/../bin:$PATH"
    '';
    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      "--" = "cd -";
      find = "fd";
      cat = "bat";
      f = "fd"; # Quick file search.
      fr = "fd -e"; # Find files with specific extensions (e.g., `fr py`).
      fo = "fzf"; # Fuzzy finder standalone.
      fof = "fd | fzf"; # Fuzzy find files using fd.
      fod = "fd -t d | fzf"; # Fuzzy find directories.
      ga = "git add";
      gaa = "git add . -A";
      gc = "git commit";
      gcm = "git commit -m";
      gca = "git commit --amend";
      gp = "git push";
      gpl = "git pull";
      gst = "git status";
      gcl = "git clone";
      gb = "git branch";
      gba = "git branch -a";
      gbd = "git branch -d";
      gbD = "git branch -D";
      gsw = "git switch";
      gswc = "git switch -c";
      grb = "git rebase";
      grbi = "git rebase -i";
      grbc = "git rebase --continue";
      gl = "git log --oneline --graph --decorate";
      glg = "git log --stat";
      glp = "git log -p";
      gll = "git log --pretty=format:'%C(auto)%h%d %s %C(blue)%an%C(reset) %C(green)(%ar)%C(reset)' --graph";
      gls = "git log --pretty=format:'%C(yellow)%h%C(reset) - %s %C(blue)(%cr) %C(green)<%an>%C(reset)' --abbrev-commit";
      gd = "git diff";
      gds = "git diff --staged";
      gdh = "git diff HEAD";
      gr = "git remote";
      gra = "git remote add";
      grv = "git remote -v";
      grm = "git remote remove";
      gpu = "git push -u origin";
      gsta = "git stash";
      gstp = "git stash pop";
      gstl = "git stash list";
      gstd = "git stash drop";
      gcp = "git cherry-pick";
      grh = "git reset --hard";
      grs = "git reset --soft";
    };
  };

  programs.wezterm = {
    enable = true;
    package = inputs.wezterm.packages.${pkgs.system}.default;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      scan_timeout = 10;
    };
  };

  programs.eza = {
    enable = true;
    git = true;
    colors = "auto";
    icons = "auto";
    enableZshIntegration = true;
  };

  programs.fd = {
    enable = true;
    hidden = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [
      "--cmd cd"
    ];
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
    };
    extraPackages = with pkgs.bat-extras; [
      batman
      batpipe
      batgrep
      batdiff
    ];
  };

  programs.tealdeer = {
    enable = true;
    settings = {
      display = {
        compact = false;
        use_pager = true;
      };
      updates = {
        auto_update = true;
      };
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
