{ ... }:

{
  programs.git = {
    enable = true;
    userName = "cmacwill1";
    userEmail = "charles.macwilliams@gmail.com";
    extraConfig.credential.helper = "store";
  };
}
