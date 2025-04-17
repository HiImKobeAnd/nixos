{ lib, config, ... }:
{
  config = lib.mkIf config.modules.services.ssh.enable {
    services.openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
      settings.KbdInteractiveAuthentication = false;
    };
  };
}
