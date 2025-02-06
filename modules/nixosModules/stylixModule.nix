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
      image = ../../wallpapers/gruvbox.png;
      fonts = {
	serif = {
	  package = pkgs.dejavu_fonts;
	  name = "DejaVu Serif";
	};

	sansSerif = {
	  package = pkgs.dejavu_fonts;
	  name = "DejaVu Sans";
	};

	monospace = {
	  package = pkgs.jetbrains-mono;
	  name = "JetBrains Mono";
	};

	emoji = {
	  package = pkgs.noto-fonts-emoji;
	  name = "Noto Color Emoji";
	};
      };
    };
  };
}
