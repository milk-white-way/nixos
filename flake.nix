# flake.nix
{
  description = "Just another NixOS configuration by Milk-White-Way";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = inputs@{ nixpkgs, home-manager, hyprland, ... }: {
    nixosConfigurations = {
      "cephalopod" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager = {
	      useGlobalPkgs = true;
              useUserPackages = true;
	    };
            home-manager.users.milk-white-way = import ./home.nix;
          }

	  hyprland.nixosModules.default
	  {
	    programs.hyprland = { 
	      enable = true;
	      nvidiaPatches = true;
	    };
          }
        ];
      };
    };
  };
}
