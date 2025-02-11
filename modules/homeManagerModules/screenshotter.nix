{pkgs, lib, config, ...}:

{
  options = {
    screenshotter.enable = 
      lib.mkEnableOption "enables (wayland) screenshotting";
  };

  config = lib.mkIf config.screenshotter.enable {

    home.packages = with pkgs; [
      grim
      slurp
      wl-clipboard
      swappy
      # Scripts!
      (writeShellScriptBin "screenshotter-copy-default" ''
        grim -g "$(slurp -w 0)" - | wl-copy
      '')
      (writeShellScriptBin "screenshotter-save-default" ''
	if [ ! -d "$HOME/screenshots" ]; then
	  mkdir "$HOME/screenshots"
	fi
	grim -g "$(slurp -w 0)" "$HOME/screenshots/$(date +%Y-%m-%d_%H-%M-%S).png" && wl-copy < $HOME/screenshots/$(date +%Y-%m-%d_%H-%M-%S).png
      '')
      (writeShellScriptBin "screenshotter-swappy" ''
        grim -g "$(slurp -w 0)" - | swappy -f -
      '')

    ];
  };
}
