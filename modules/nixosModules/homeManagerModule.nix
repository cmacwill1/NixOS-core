{ inputs, lib, config, ... }:

{
  options.homeManagerModule = {
    enable = lib.mkEnableOption "Enables home-manager with minimal default variation";
    variation = lib.mkOption {
      type = lib.types.str;
      default = "minimal";
    };
  };

  config = lib.mkIf config.homeManagerModule.enable {
    home-manager = {
      extraSpecialArgs = {inherit inputs;};
      useUserPackages = true;
      useGlobalPkgs = true;
      
      users = {
	"cmacwill" = import ../../userHomeEnvironments/${config.homeManagerModule.variation}.nix;
      };

      sharedModules = [
	inputs.nixvim.homeManagerModules.nixvim
	inputs.textfox.homeManagerModules.default
      ];
    };
  };
}
