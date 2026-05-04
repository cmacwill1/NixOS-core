{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    textfox = {
      url = "github:adriankarlen/textfox";
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
    { nixpkgs, ... }@inputs:
    {
      nixosConfigurations = {
        nixtop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/nixtop/configuration.nix
            inputs.home-manager.nixosModules.default

            {
              home-manager = {
                extraSpecialArgs = { inherit inputs; };
                useUserPackages = true;
                useGlobalPkgs = true;

                sharedModules = [
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

            {
              home-manager = {
                extraSpecialArgs = { inherit inputs; };
                useUserPackages = true;
                useGlobalPkgs = true;

                sharedModules = [
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
