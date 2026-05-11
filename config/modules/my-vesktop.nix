{ self, inputs, ... }:
{
  imports = [
    inputs.flake-parts.flakeModules.easyOverlay
  ];

  flake.nixosModules.my-vesktop =
    { pkgs, ... }:
    {
      nixpkgs.overlays = [ self.overlays.default ];
      environment.systemPackages = [ pkgs.my-vesktop ];
    };

  perSystem =
    {
      pkgs,
      lib,
      final,
      ...
    }:
    let
      vesktop-src = pkgs.fetchFromGitHub {
        owner = "Vencord";
        repo = "Vesktop";
        rev = "797c02bdd0d35063ac76d75cffa77b0790f3a657";
        hash = "sha256-xeeg1U0+1lfJxTZQsY5Y49aM66Qp/1zqVkKSiewSxJk=";
      };
    in
    {
      overlayAttrs = {
        my-vesktop =
          (pkgs.vesktop.override {
            electron_40 = pkgs.electron_41;
          }).overrideAttrs
            (oldAttrs: {
              src = vesktop-src;
              version = "1.6.5";

              pnpmDeps = pkgs.fetchPnpmDeps {
                pname = "vesktop";
                version = "1.6.5";
                src = vesktop-src;
                patches = [ ];
                pnpm = pkgs.pnpm_10_29_2;
                fetcherVersion = 2;
                hash = "sha256-nOwl/e5lL8UGjwUexm/EiA7cPmWYif9PHwa0vAX5VbM=";
              };

              # env = (oldAttrs.env or { }) // {
              # ELECTRON_SKIP_BINARY_DOWNLOAD = "1";
              # IS_VESKTOP_BUILD = "1";
              # };
            });
      };

      packages.default = pkgs.my-vesktop;
    };
}
