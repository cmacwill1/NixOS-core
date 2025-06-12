{ ... }:

{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "anvil" = {
	hostname = "anvil.rcac.purdue.edu";
	user = "x-cmacwilliams";
	identityFile = "~/.ssh/anvil";
      };
    };
  };
}
