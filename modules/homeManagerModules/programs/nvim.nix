{pkgs, lib, config, ... }:

{
  options = {
    nvim.enable =
      lib.mkEnableOption "enables nvim";
  };

  config = lib.mkIf config.nvim.enable {
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      bufferline-nvim
      lualine-nvim
      nvim-web-devicons
      nvim-lspconfig
      nvim-cmp
      lspkind-nvim
      cmp-nvim-lsp
    ];
    extraPackages = with pkgs; [
      wl-clipboard
      nixd
      alejandra
    ];
    extraLuaConfig = ''
      ${builtins.readFile ./extras/options.lua}
      ${builtins.readFile ./plugins/lsp.lua}
      ${builtins.readFile ./plugins/cmp.lua}
      require("bufferline").setup({
        options = {
          themable = true,
        }
      })
      require("lualine").setup({})
      require("nvim-web-devicons").setup({})
    '';
  };
  };
}
