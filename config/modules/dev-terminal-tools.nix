{ self, inputs, ... }:
{
  flake.nixosModules.dev-terminal-tools =
    { pkgs, ... }:
    {
      programs = {
        zoxide = {
          enable = true;
          enableFishIntegration = true;
          flags = [ "--cmd cd" ];
        };
        starship.enable = true;
      };

      environment.systemPackages = with pkgs; [
        gh
        koji
        fzf
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
          alias = {
            st = "status";
            aa = "add -A";
            ll = "log --oneline --decorate --graph";
            last = "log -1 HEAD";
            unstage = "reset HEAD --";
          };
        };
      };
    };
}
