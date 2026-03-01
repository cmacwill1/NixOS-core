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

    /*
      firefox-addons = {
        url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    */

    textfox = {
      url = "github:adriankarlen/textfox";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    tidal = {
      url = "github:cmacwill1/tidalcycles";
    };

    scientific-fhs = {
      url = "github:olynch/scientific-fhs";
    };

    #NUR
    flake-utils.url = "github:numtide/flake-utils";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.noctalia-qs.follows = "noctalia-qs";
    };

    noctalia-qs = {
      url = "github:noctalia-dev/noctalia-qs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    { nixpkgs, nur, ... }@inputs:
    {
      nixosConfigurations = {
        nixtop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/nixtop/configuration.nix
            inputs.home-manager.nixosModules.home-manager
            inputs.stylix.nixosModules.stylix
            {
              nixpkgs.overlays = [ inputs.tidal.overlays.default ];
            }

            {
              home-manager = {
                extraSpecialArgs = { inherit inputs; };
                useUserPackages = true;
                useGlobalPkgs = true;

                sharedModules = [
                  inputs.nixvim.homeModules.nixvim
                  inputs.textfox.homeManagerModules.default
                  inputs.noctalia.homeModules.default
                ];

                users = {
                  "cmacwill" = import ./hosts/nixtop/home.nix;
                };
              };
            }

          ];
        };

        desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/desktop/configuration.nix
            inputs.home-manager.nixosModules.default
            inputs.stylix.nixosModules.stylix
            # Adds the NUR overlay
            nur.modules.nixos.default
            # NUR modules to import
            nur.legacyPackages."x86_64-linux".repos.iopq.modules.xraya
            {
              nixpkgs.overlays = [ inputs.tidal.overlays.default ];
            }

            {
              home-manager = {
                extraSpecialArgs = { inherit inputs; };
                useUserPackages = true;
                useGlobalPkgs = true;

                sharedModules = [
                  inputs.nixvim.homeModules.nixvim
                  inputs.textfox.homeManagerModules.default
                  inputs.noctalia.homeModules.default
                ];

                users = {
                  "cmacwill" = import ./hosts/desktop/home.nix;
                };
              };
            }
          ];
        };
      };
    };
}
