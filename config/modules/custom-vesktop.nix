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
    {
      overlayAttrs = {
        my-vesktop = pkgs.vesktop.overrideAttrs (oldAttrs: rec {
          src = pkgs.fetchFromGitHub {
            owner = "Vencord";
            repo = "Vesktop";
            rev = "global-shortcuts";
            hash = "sha256-PCRRbcqf8RczsGQ8lxYIfy9RWNkVe3qsstAWrHc42Mc=";
          };

          electron = pkgs.electron_41;

          pnpmDeps = pkgs.fetchPnpmDeps {
            inherit (oldAttrs) pname;
            src = src;
            fetcherVersion = oldAttrs.pnpmDeps.fetcherVersion;
            hash = "sha256-nOwl/e5lL8UGjwUexm/EiA7cPmWYif9PHwa0vAX5VbM=";
          };

          buildPhase = ''
            sed -i 's/"electron": "[^"]*"/"electron": "${electron.version}"/g' package.json
          ''
          + (oldAttrs.buildPhase or "");

          env = (oldAttrs.env or { }) // {
            ELECTRON_SKIP_BINARY_DOWNLOAD = "1";
            VESKTOP_SKIP_DAT_CHECK = "1";
          };
        });
      };
      packages.default = pkgs.my-vesktop;
    };
}
