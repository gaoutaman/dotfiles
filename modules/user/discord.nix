{inputs, ...}: {
  imports = [inputs.nixcord.homeManagerModules.nixcord];
  programs.nixcord = {
    enable = true;
    config.transparent = true;
    config.frameless = true;
    config.plugins.alwaysAnimate.enable = true;
  };
}
