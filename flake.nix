{
	description = "NixOS";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		hyprland.url = "github:hyprwm/Hyprland";
		wezterm.url = "github:wez/wezterm?dir=nix";
	};

	outputs = {self, ...}@inputs: let
		system = "x86_64-linux";
		pkgs = import inputs.nixpkgs {
			inherit system;
			config = {
				allowUnfree = true;
				allowUnfreePredicate = _: true;
			};
		};
	in {
		nixosConfigurations.X = pkgs.lib.nixosSystem {
			specialArgs = { inherit inputs system; };
			modules = [ ./host/configuration.nix ];
		};
	};
}
