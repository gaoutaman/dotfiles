{...}: {
  programs.wofi = {
    enable = true;
    settings = {
      allow_images = true;
      prompt = "Launch App...";
      insenstive = true;
    };
  };
}
