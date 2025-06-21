{ pkgs, lib, config, ... }:

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
	      { name = "vimtex"; }
              { name = "path"; }
              { name = "nvim_lsp"; }
              { name = "luasnip"; }
              { name = "buffer"; }
              #{ name = "bibtex"; }
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
	/*
        cmp-nvim-lsp.enable = true;
        cmp-buffer.enable = true;
        cmp-path.enable = true;
	cmp-vimtex.enable = true;
	*/
      };
/*
      extraPlugins = [(pkgs.vimUtils.buildVimPlugin {
	name = "cmp-bibtex";
	src = pkgs.fetchFromGitHub {
	  owner = "liamvdvyver";
	  repo = "cmp-bibtex";
	  rev = "5c30c7c3d748975d3f3b309ccbc06a08cf6a42ab";
	  hash = "sha256-0sNzbUh0LsMHI2DMp1MOTbSecm/AG26GchdKs0BVvrE=";
	};
      })];

      extraConfigLua = ''
       require("cmp-bibtex").setup({
	 files = { "./references.bib", "../references.bib" },
	 filetypes = { "markdown", "rmd", "tex" }
       })
      '';
  */    

  /*
      extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
	name = "scnvim";
	src = pkgs.fetchFromGitHub {
	  owner = "davidgranstrom";
	  repo = "scnvim";
	  rev = "7fcfd73d6d3b4cf6a31f62f07de3e35744962a20";
	  hash = "sha256-K+AbvYMYwFf1uD5RsMvTGbWuDqBMnmlB7Pci7g7g2rw=";
	};
      })

      (pkgs.vimUtils.buildVimPlugin {
	name = "vim-tidal";
	src = pkgs.fetchFromGitHub {
	  owner = "tidalcycles";
	  repo = "vim-tidal";
	  rev = "e440fe5bdfe07f805e21e6872099685d38e8b761";
	  hash = "sha256-8gyk17YLeKpLpz3LRtxiwbpsIbZka9bb63nK5/9IUoA=";
	};
      })];

*/

      extraPlugins = [pkgs.vimPlugins.vim-tidal];
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
