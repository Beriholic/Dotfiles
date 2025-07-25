# This file defines overlays
{ inputs, ... }:
{
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });
    hyprscroller = inputs.hyprscroller.packages.${final.system}.hyprscroller;
    wpsoffice-cn = inputs.nix-wpsoffice-cn.packages.${final.system}.wpsoffice-cn;
    chinese-fonts = inputs.nix-wpsoffice-cn.packages.${final.system}.chinese-fonts;
    quickshell = inputs.quickshell.packages.${final.system}.default;
    nutil = inputs.nutil.packages.${final.system}.default;
    geminic = inputs.geminic.packages.${final.system}.default;
  };

  # When applied, the unstable nixpkgs set (declared in the flake inputs) will
  # be accessible through 'pkgs.unstable'
  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
