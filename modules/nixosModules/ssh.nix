{ ... }:

{
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    allowSFTP = true;
    settings = {
      PasswordAuthentication = true;
      UseDns = true;
    };
  };
}
