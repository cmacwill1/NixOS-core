{pkgs, lib, config, ... }:

{
  options = {
    nixvim.enable =
      lib.mkEnableOption "enables nixvim";
  };

  config = lib.mkIf config.nixvim.enable {
    home.packages = with pkgs; [
      ltex-ls
    ];

    programs.nixvim = {
      enable = true;

      vimAlias = true;
      viAlias = true;

      plugins = {
        lualine.enable = true;
	bufferline.enable = true;
	web-devicons.enable = true;
	direnv.enable = true;
	vimtex = {
	  enable = true;
	  texlivePackage = pkgs.texlive.combined.scheme-full;
	  settings = {
            view_method = "mupdf";
	  };
	};

	lsp = {
	  enable = true;
	  servers = {
	    nixd.enable = true;
	    pyright.enable = true;
	    ltex.enable = true;
	  };
	};
	
	cmp = {
          enable = true;
          autoEnableSources = true;
          settings = {
            sources = [
              { name = "nvim_lsp"; }
              { name = "luasnip"; }
              { name = "buffer"; }
              { name = "path"; }
            ];
            mapping = {
              "<CR>" = "cmp.mapping.confirm({ select = true })";
              "<Down>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
              "<Up>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
              "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
              "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
              "<C-d>" = "cmp.mapping.scroll_docs(-4)";
              "<C-f>" = "cmp.mapping.scroll_docs(4)";
              "<C-Space>" = "cmp.mapping.complete()";
            };
          };
        };
        cmp-nvim-lsp.enable = true;
        cmp-buffer.enable = true;
        cmp-path.enable = true;
	cmp-vimtex.enable = true;
      };
      
      clipboard.providers.wl-copy.enable = true;

      globals.mapleader = " ";

      opts = {
        number = true;
        relativenumber = true;

        shiftwidth = 2;
      };
    };
  };
}
