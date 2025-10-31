{ lib, config, ... }:

{
  options = {
    fish.enable =
      lib.mkEnableOption "enables fish shell (note that this `programs.fish.enable = true;` must be set in configuration.nix";
  };

  config = lib.mkIf config.fish.enable {
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
	starship init fish | source
	direnv hook fish | source
	export MANPAGER="less -M -R -i --use-color -Dd+R -Du+B -DHkC -j5" # https://felipec.wordpress.com/2021/06/05/adventures-with-man-color/
	export MANROFFOPT="-c"  # unclear if this does anything on nixos
	fish_vi_key_bindings
      '';
      shellAliases = {
	g = "git";
	lg = "lazygit";
	gt = "go_to_project";
	y = "yazi";
	z = "zathura";
	v = "nvim_open";
      };
      functions = {
	go_to_project = {
	  body = ''
	    set dir (find ~/projects -type d \
		-name .git -prune -o \
		-name .direnv -prune -o \
		-name __pycache__ -prune -o \
		-type d -print | fzf)
	    if test -n "$dir"
		cd "$dir"
	    end
	  '';
	};
	nvim_open = {
	  body = ''
	      if count $argv > /dev/null
		  nvim $argv
	      else
		  nvim +":lua require('telescope.builtin').find_files()"
	      end
	  '';
	};
      };
    };
  };
}
