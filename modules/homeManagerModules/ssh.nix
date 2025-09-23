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
      "dogmatix" = {
	hostname = "10.165.53.37";
	user = "cmacwill";
	identityFile = "~/.ssh/dogmatix";
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
