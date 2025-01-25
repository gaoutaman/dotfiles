{pkgs, ...}: {
  programs.firefox = {
    enable = true;
    profiles.gaoutaman = {
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        youtube-recommended-videos
        ublock-origin
        privacy-badger
      ];
    };
  };
}
