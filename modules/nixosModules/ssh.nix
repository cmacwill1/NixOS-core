{ ... }:

{
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    allowSFTP = true;
    settings = {
      PasswordAuthentication = false;
      UseDns = true;
    };
  };
}
