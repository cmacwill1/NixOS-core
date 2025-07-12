{ inputs, ... }:

{
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    useUserPackages = true;
    useGlobalPkgs = true;

    sharedModules = [
      inputs.nixvim.homeManagerModules.nixvim
      inputs.textfox.homeManagerModules.default
      inputs.hyprcursor-phinger.homeManagerModules.hyprcursor-phinger
    ];
  };
}
