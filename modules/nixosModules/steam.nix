{ pkgs, lib, config, ... }:

{
  options = {
    steam.enable = 
      lib.mkEnableOption "enables steam";
  };

  config = lib.mkIf config.steam.enable {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    environment.systemPackages = with pkgs; [
      mangohud
    ];
    programs.gamemode.enable = true;
  };
}
