{ ... }:
{
  flake.nixosModules.zed =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        (pkgs.zed-editor.fhsWithPackages (
          p: with p; [
            nixd
            rustc
          ]
        ))
      ];
    };
}
