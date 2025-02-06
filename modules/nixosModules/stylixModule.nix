{ pkgs, lib, config, ... }:

{
  options = {
    stylixModule.enable =
      lib.mkEnableOption "enables general stylix configuration module";
  };

  config = lib.mkIf config.stylixModule.enable {
    stylix = {
      enable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-soft.yaml";
      image = ../../wallpapers/gruvbox1.jpg;
      fonts = {
	monospace = {
	  package = pkgs.nerd-fonts.jetbrains-mono;
	  name = "JetBrainsMono Nerd Font";
	};
	serif = config.stylix.fonts.monospace;
	sansSerif = config.stylix.fonts.monospace;
	emoji = config.stylix.fonts.monospace;
	sizes = {
	  applications = 13;
	  terminal = 13;
	  desktop = 10;
	  popups = 10;
	};
      };
    };
  };
}
