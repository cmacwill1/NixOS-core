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
      "utopia" = {
	hostname = "utopia.ecn.purdue.edu";
	user = "cmacwill";
	identityFile = "~/.ssh/utopia";
      };
      "majestix" = {
	hostname = "majestix.ecn.purdue.edu";
	user = "cmacwill";
	identityFile = "~/.ssh/majestix";
      };
    };
  };
}
