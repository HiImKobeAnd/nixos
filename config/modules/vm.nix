{
  ...
}:
{
  flake.nixosModules.vm =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        qemu
        swtpm
        quickemu
        virt-manager
        spice
      ];
      services.spice-vdagentd.enable = true;
    };
}
