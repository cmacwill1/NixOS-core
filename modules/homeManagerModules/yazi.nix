{ ... }:

{
  programs.yazi = {
    enable = true;
    keymap = {
          # add keymaps for shortcuts
      manager.prepend_keymap =
        [
	  # dropping to shell
          {
            on = "!";
            run = # sh
	      ''shell "$SHELL" --block --confirm'';
            desc = "Open shell here";
          }
	];
    };

    settings = {
      opener = {
        # https://github.com/sxyazi/yazi/discussions/1083
        edit = [
          {
            run = "direnv exec . $EDITOR $1";
            block = true;
          }
        ];
      };
    };
  };
}
