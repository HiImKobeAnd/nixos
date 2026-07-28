{ self, inputs, ... }:
{
  flake.nixosModules.git =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        # self.packages.${pkgs.stdenv.hostPlatform.system}.myJJ
        pkgs.koji
        pkgs.gh
        pkgs.delta
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

          core.pager = "${lib.getExe pkgs.delta}";
          interactive.diffFitler = "${lib.getExe pkgs.delta} --color-only";
          delta = {
            navigate = true;
            side-by-side = true;
            line-numbers = true;
            syntax-mapping = "luau:Lua";
          };
          merge.conflictstyle = "zdiff3";

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
