{ inputs, ... }:

{
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    useUserPackages = true;
    useGlobalPkgs = true;

    sharedModules = [
      inputs.nixvim.homeManagerModules.nixvim
      inputs.textfox.homeManagerModules.default
    ];
  };
}
