{ inputs, ... }:
{
  flake.hjemModules.desktop =
    { pkgs, ... }:
    {
      imports = [
        inputs.hjem.nixosModules.default
      ];
      hjem.users.hiimkobeand = {
        user = "hiimkobeand";
        directory = "/home/hiimkobeand";
        xdg.config.files = {
          # "hypr".source = ../../../extra/hyprland;
          "git/config".clobber = true;
          "git/config".text = ''
            [user]
              name = "hiimkobeand"
              email = "hiimkobeand@gmail.com"

            [alias]
              st = status;
              aa = add -A;
              ll = log --oneline --decorate --graph;
              last = log -1 HEAD;
              unstage = reset HEAD --;

            [core]
              pager = delta

            [interactive]
              diffFilter = delta --color-only

            [delta]
              navigate = true

            [merge]
              conflictStyle = zdiff3
          '';
        };
      };
    };
}
