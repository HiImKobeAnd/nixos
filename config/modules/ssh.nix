{ ... }:
{
  flake.nixosModules.ssh =
    { ... }:
    {
      services.openssh = {
        enable = true;
        settings.PasswordAuthentication = false;
        settings.KbdInteractiveAuthentication = false;
        authorizedKeysFiles = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKtL57ynKkB4Sul/DcDwKIX8oYEhHb3OcpWpSxEdbj5B"
        ];
      };
    };
}
