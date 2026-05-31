{ ... }:
{
  flake.nixosModules.vesktop =
    { pkgs, ... }:
    let
      src = pkgs.fetchFromGitHub {
        owner = "Vencord";
        repo = "Vesktop";
        rev = "797c02bdd0d35063ac76d75cffa77b0790f3a657";
        hash = "sha256-xeeg1U0+1lfJxTZQsY5Y49aM66Qp/1zqVkKSiewSxJk=";
      };
    in
    {
      environment.systemPackages = [
        (pkgs.vesktop.override { electron_40 = pkgs.electron_41; }).overrideAttrs
        (_: {
          inherit src;
          pnpmDeps = pkgs.fetchPnpmDeps {
            pname = "vesktop";
            version = "1.6.5";
            inherit src;
            patches = [ ];
            pnpm = pkgs.pnpm_10_29_2;
            fetcherVersion = 2;
            hash = "sha256-nOwl/e5lL8UGjwUexm/EiA7cPmWYif9PHwa0vAX5VbM=";
          };
        })
      ];
    };
}
