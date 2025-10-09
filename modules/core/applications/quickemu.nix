{
  lib,
  config,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.modules.applications.quickemu.enable {
    environment.systemPackages = with pkgs; [
      qemu
      swtpm
      quickemu
      virt-manager
    ];
  };
}
