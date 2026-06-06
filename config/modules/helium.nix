{ inputs, ... }:
{
  flake.nixosModules.helium =
    { pkgs, system, ... }:
    {
      imports = [
        inputs.helium.nixosModules.default
      ];
      programs.helium = {
        enable = true;
        flags = [
          "--ozone-platform-hint=auto"
        ];
        policies = {
          "BrowserSignin" = 0;
          "PasswordManagerEnabled" = false;
          "SyncDisabled" = true;
          "SpellcheckEnabled" = true;
          "SpellcheckLanguage" = [
            "da"
            "en-GB"
          ];
          "DefaultSearchProviderEnabled" = true;
          "DefaultSearchProviderSearchURL" = "https://duckduckgo.com/?q=%s";
          "RestoreOnStartup" = 1;
        };
      };
    };
}
