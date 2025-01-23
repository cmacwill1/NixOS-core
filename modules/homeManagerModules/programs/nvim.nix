{pkgs, lib, config, ... }:

{
  options = {
    nvim.enable =
      lib.mkEnableOption "enables nvim";
  };

  config = lib.mkIf config.nvim.enable {
    programs.nixvim = {
      enable = true;

      vimAlias = true;
      viAlias = true;

      plugins = {
        lualine.enable = true;
	bufferline.enable = true;
	web-devicons.enable = true;
      };
      
      globals.mapleader = " ";

      opts = {
        number = true;
        relativenumber = true;

        shiftwidth = 2;
      };
    };
  };
}
