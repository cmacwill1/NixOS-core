{pkgs, lib, config, ... }:

{
  options = {
    nvim.enable =
      lib.mkEnableOption "enables nvim";
  };

  config = lib.mkIf config.nvim.enable {
    programs.nixvim = {
      enable = true;
      plugins = {
        lualine.enable = true;
	bufferline.enable = true;
	web-devicons.enable = true;
      };
    };
  };
}
