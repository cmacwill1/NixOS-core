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
      "*" = {
	user = "cmacwill";
	identityFile = "~/.ssh/homelab";
      };
      "github.com" = {
	hostname = "github.com";
	user = "git";
	identityFile = "~/.ssh/id_ed25519";
      };
    };
  };
}
