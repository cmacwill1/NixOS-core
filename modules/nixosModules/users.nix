{ pkgs, lib, config, inputs, ... }:

{
  options = {
    users.enable =
      lib.mkEnableOption "user support";
  };

  config = lib.mkIf config.users.enable {
    users.users.cmacwill = {
      isNormalUser = true;
      description = "cmacwill";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      shell = pkgs.zsh;
    };

    home-manager = {
      extraSpecialArgs = {
        inherit inputs;
      };
      users = {
        "cmacwill" = import ./home.nix;
      };
      useGlobalPkgs = true;
    };
  };
}
