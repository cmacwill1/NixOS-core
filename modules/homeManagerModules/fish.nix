{ lib, config, ... }:

{
  options = {
    fish.enable =
      lib.mkEnableOption "enables fish shell (note that this `programs.fish.enable = true;` must be set in configuration.nix";
  };

  config = lib.mkIf config.fish.enable {
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
	starship init fish | source
	direnv hook fish | source
      '';
    };
  };
}
