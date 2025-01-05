{pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      bufferline-nvim
      lualine-nvim
      nvim-lspconfig
      nvim-web-devicons
      nvim-cmp
    ];
    extraPackages = with pkgs; [
      wl-clipboard
      nixd
      alejandra
    ];
    extraLuaConfig = ''
      ${builtins.readFile ./plugins/test.lua}
      ${builtins.readFile ./plugins/cmp.lua}
      require("bufferline").setup{}
      require("lualine").setup({
        icons_enabled = true,
      })

    '';
  };
}
