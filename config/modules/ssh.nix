{ ... }:
{
  flake.nixosModules.ssh =
    { ... }:
    {
      services.openssh = {
        enable = true;
        settings.PasswordAuthentication = false;
        settings.KbdInteractiveAuthentication = false;
      };
    };
}
