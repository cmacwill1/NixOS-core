{ pkgs, ... }:

{
  users.users.cmacwill = {
    isNormalUser = true;
    description = "cmacwill";
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
    ];
    shell = pkgs.fish;
  };
}
