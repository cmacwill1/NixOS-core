{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "cmacwill1";
        email = "charles.macwilliams@gmail.com";
      };
      credential.helper = "store";
    };
  };

}
