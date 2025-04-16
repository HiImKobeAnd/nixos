{
  pkgs,
  lib,
  config,
  ...
}:
{
  config = lib.mkIf config.modules.applications.librewolf.enable {
    programs.firefox = {
      enable = true;
      package = pkgs.librewolf;
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        Preferences = {
          "cookiebanners.service.mode.privateBrowsing" = 2;
          "cookiebanners.service.mode" = 2;
          "privacy.donottrackheader.enabled" = true;
          "privacy.fingerprintingProtection" = true;
          "privacy.resistFingerprinting" = true;
          "privacy.trackingprotection.emailtracking.enabled" = true;
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.fingerprinting.enabled" = true;
          "privacy.trackingprotection.socialtracking.enabled" = true;
          "sidebar.verticalTabs" = true;
        };
        ExtensionSettings =
          with builtins;
          let
            extension = shortId: uuid: {
              name = uuid;
              value = {
                install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
                installation_mode = "normal_installed";
              };
            };
          in
          listToAttrs [
            (extension "bitwarden-password-manager" "{446900e4-71c2-419f-a6a7-df9c091e268b}")
            (extension "darkreader" "addon@darkreader.org")
            (extension "dearrow" "deArrow@ajay.app")
            (extension "mal-sync" "{c84d89d9-a826-4015-957b-affebd9eb603}")
            (extension "modern-for-wikipedia" "{e9090647-32ff-48e4-9c3c-1361e8fd270e}")
            (extension "sponsorblock" "sponsorBlocker@ajay.app")
            (extension "ublock-origin" "uBlock0@raymondhill.net")
            (extension "yang-addon" "0a3250b1-58e0-48cb-9383-428f5adc3dc1")
          ];
        "uBlock0@raymondhill.net" = {
          userSettings = {
            cloudStorageEnabled = false;
            selectedFilterLists = [
              "adguard-generic"
              "adguard-annoyance"
              "adguard-social"
              "adguard-spyware-url"
              "ublock-abuse"
              "ublock-badware"
              "ublock-filters"
              "ublock-privacy"
              "ublock-quick-fixes"
              "ublock-unbreak"
            ];
          };
        };
      };
    };
  };
}
