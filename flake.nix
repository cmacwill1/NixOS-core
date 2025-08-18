{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    textfox = {
      url = "github:adriankarlen/textfox";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    tidal = {
      url = "github:cmacwill1/tidalcycles";
    };
    #NUR
    flake-utils.url = "github:numtide/flake-utils";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nur, ... }@inputs:{
    nixosConfigurations = {
      nixtop = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	specialArgs = {inherit inputs;};
	modules = [
	  ./hosts/nixtop/configuration.nix
	  inputs.home-manager.nixosModules.home-manager
	  inputs.stylix.nixosModules.stylix
	  {
	    nixpkgs.overlays = [inputs.tidal.overlays.default];
	  }
	];
      };
    
      desktop = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	specialArgs = {inherit inputs;};
	modules = [
	  ./hosts/desktop/configuration.nix
	  inputs.home-manager.nixosModules.default
	  inputs.stylix.nixosModules.stylix
	  # Adds the NUR overlay
	  nur.modules.nixos.default
	  # NUR modules to import
	  nur.legacyPackages."x86_64-linux".repos.iopq.modules.xraya
	  {
	    nixpkgs.overlays = [inputs.tidal.overlays.default];
	  }
	];
      };
      portable = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	specialArgs = {inherit inputs;};
	overlays = [ inputs.tidal.overlays.default ];
	modules = [
	  ./hosts/portable/configuration.nix
	  inputs.home-manager.nixosModules.default
	  inputs.stylix.nixosModules.stylix
	];
      };
    };
  };
}
