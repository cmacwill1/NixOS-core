{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    stylix.url = "github:danth/stylix";
    
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      nixtop = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	specialArgs = {inherit inputs;};
	modules = [
	  ./hosts/nixtop/configuration.nix
	  inputs.home-manager.nixosModules.home-manager
	  inputs.stylix.nixosModules.stylix
	];
      };
    
      desktop = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	specialArgs = {inherit inputs;};
	modules = [
	  ./hosts/desktop/configuration.nix
	  inputs.home-manager.nixosModules.default
	  inputs.stylix.nixosModules.stylix
	];
      };
      portable = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	specialArgs = {inherit inputs;};
	modules = [
	  ./hosts/portable/configuration.nix
	  inputs.home-manager.nixosModules.default
	  inputs.stylix.nixosModules.stylix
	];
      };
    };
  };
}
