{ lib, config, ... }:

{
  options = {
    starship.enable =
      lib.mkEnableOption "enables starship";
  };

  config = lib.mkIf config.starship.enable {
    programs.starship = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        add_newline = false;
        buf = {
          symbol = " ";
        };
        c = {
          symbol = " ";
        };
        directory = {
          read_only = " 󰌾";
        };
        docker_context = {
          symbol = " ";
        };
        fossil_branch = {
          symbol = " ";
        };
        git_branch = {
          symbol = " ";
        };
	git_status = {
          conflicted = "=$count ";
	  deleted = "✘$count ";
	  format = "[[($conflicted$untracked$staged$modified$renamed$deleted)](218) ($ahead_behind$stashed)]($style) ";
	  modified = "!$count ";
	  renamed = "»$count ";
	  staged = "+$count ";
	  stashed = "≡$count ";
	  untracked = "?$count ";
	  style = "bold red";
	};
        golang = {
          symbol = " ";
        };
        hg_branch = {
          symbol = " ";
        };
        hostname = {
          ssh_symbol = " ";
        };
        lua = {
          symbol = " ";
        };
        memory_usage = {
          symbol = "󰍛 ";
        };
        meson = {
          symbol = "󰔷 ";
        };
        nim = {
          symbol = "󰆥 ";
        };
        nix_shell = {
          symbol = " ";
        };
        nodejs = {
          symbol = " ";
        };
        ocaml = {
          symbol = " ";
        };
        package = {
          symbol = "󰏗 ";
        };
        python = {
          symbol = " ";
        };
        rust = {
          symbol = " ";
        };
        swift = {
          symbol = " ";
        };
        zig = {
          symbol = " ";
        };
      };
    };
  };
}

