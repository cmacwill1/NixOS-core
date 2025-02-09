{ ... }:

{
  programs.yazi = {
    enable = true;
  };
        programs.yazi.settings = {
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
}
