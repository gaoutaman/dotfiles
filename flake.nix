{
  description = "NixOS";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager-stable = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    wezterm.url = "github:wez/wezterm?dir=nix";
    blocklist-hosts = {
      url = "github:StevenBlack/hosts";
      flake = false;
    };
    hyprpolkit.url = "github:hyprwm/hyprpolkitagent";
stylix.url = "github:danth/stylix";
swww.url = "github:LGFae/swww";
yazi.url = "github:sxyazi/yazi";
    yazi-plugins = {
      url = "github:yazi-rs/plugins";
      flake = false;
    };
    nixcord = {
      url = "github:kaylorben/nixcord";
    };
  };

  outputs = {self, ...} @ inputs: let
    system = "x86_64-linux";
    pkgs = import inputs.nixpkgs {
      inherit system;
      overlays = [inputs.nur.overlays.default];
      config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
      };
    };
    pkgs-stable = import inputs.nixpkgs-stable {
      inherit system;
      overlays = [inputs.nur.overlays.default];
      config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true; # set certain packages and disable allowUnfree
      };
    };
  in {
    nixosConfigurations.X = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs system pkgs-stable;};
      modules = [./host/configuration.nix];
    };
    homeConfigurations.gaoutaman = inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {inherit inputs system pkgs-stable;};
      modules = [./host/home.nix];
    };
  };
}
