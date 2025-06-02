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
	export MANPAGER="less -M -R -i --use-color -Dd+R -Du+B -DHkC -j5" # https://felipec.wordpress.com/2021/06/05/adventures-with-man-color/
	export MANROFFOPT="-c"  # unclear if this does anything on nixos
      '';
      
    };
  };
}
