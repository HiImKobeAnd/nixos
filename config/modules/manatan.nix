{ ... }:
{
  flake.nixosModules.manatan =
    { pkgs, ... }:
    let
      manatan = pkgs.callPackage (
        {
          stdenv,
          fetchurl,
          libgcc,
          wayland,
          libxkbcommon,
          buildFHSEnv,
          copyDesktopItems,
          makeDesktopItem,
        }:
        let
          pkg = stdenv.mkDerivation (finalAttrs: {
            pname = "manatan";
            version = "6.0.27";

            src =
              let
                selectSystem =
                  attrs:
                  attrs.${stdenv.hostPlatform.system} or (throw "Unsupported system: ${stdenv.hostPlatform.system}");
                system = selectSystem {
                  x86_64-linux = "amd64";
                  aarch64-linux = "arm64";
                };
              in
              fetchurl {
                url = "https://github.com/KolbyML/Manatan/releases/download/v${finalAttrs.version}/Manatan-v${finalAttrs.version}-Linux-${system}.tar.gz";
                sha256 = selectSystem {
                  x86_64-linux = "sha256-7A4wKeWyEc+ceQyaQKjbSVCWQl96MGtALmNscTULd/s=";
                  aarch64-linux = "sha256-PGKGFmyhIlFvcV9vhtq3sLLBbO/Mb3WHVF7fD1dvFFM=";
                };
              };

            buildInputs = [ libgcc ];
            sourceRoot = ".";

            installPhase = ''
              install -m755 -D manatan $out/bin/manatan
            '';

            runtimeDependencies = [
              wayland
              libxkbcommon
            ];

            meta = {
              homepage = "https://manatan.com";
              description = "Seamless immersion language learning for anime, manga, novels on all platforms";
            };
          });
        in
        buildFHSEnv {
          inherit (pkg) pname version;

          runScript = "${pkg.outPath}/bin/manatan";

          desktopItems = [
            (makeDesktopItem {
              name = "manatan";
              exec = "manatan"; # The name of the FHS env wrapper script
              icon = "manatan"; # If you find an icon in the source, place it in $out/share/icons
              comment = pkg.meta.description;
              desktopName = "Manatan";
              genericName = "Language Learning App";
              categories = [
                "Education"
                "Utility"
              ];
            })
          ];

          targetPkgs =
            pkgs: with pkgs; [
              fontconfig
              wayland
              libxkbcommon
              freetype
              libz
              libGL
              glib
              nspr
              nss
              dbus
              at-spi2-core
              cups
              libx11
              libxcomposite
              libxdamage
              libxext
              libxfixes
              libxrandr
              libgbm
              libxcb
              cairo
              pango
              lsof
              udev
              alsa-lib

              gtk3
              harfbuzz
              gdk-pixbuf
              libxi
              mpv
              libepoxy
              expat
            ];
        }
      ) { };
    in
    {
      environment.systemPackages = [ manatan ];
    };
}
