{ self, inputs, ... }:
{
  flake.nixosModules.git =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.myJJ
        pkgs.koji
        pkgs.gh
      ];
      programs.git = {
        enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.myGit;
      };
    };

  perSystem =
    { pkgs, lib, ... }:
    {
      packages.myGit = inputs.wrapper-modules.wrappers.git.wrap {
        inherit pkgs;
        settings = {
          user.email = "hiimkobeand@gmail.com";
          user.name = "hiimkobeand";
          credential.helper = "${lib.getExe pkgs.gh} auth git-credential";
          alias = {
            st = "status";
            aa = "add -A";
            ll = "log --oneline --decorate --graph";
            last = "log -1 HEAD";
            unstage = "reset HEAD --";
          };
        };
      };
      packages.myJJ = inputs.wrapper-modules.wrappers.jujutsu.wrap {
        inherit pkgs;
        settings = {
          user.email = "hiimkobeand@gmail.com";
          user.name = "hiimkobeand";
        };
      };
    };
}
