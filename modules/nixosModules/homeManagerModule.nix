{ inputs, ... }:

{
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    useUserPackages = true;
    useGlobalPkgs = true;

    sharedModules = [
      inputs.nixvim.homeModules.nixvim
      inputs.textfox.homeManagerModules.default
    ];
  };
}
