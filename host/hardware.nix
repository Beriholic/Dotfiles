{ pkgs, config, ... }:
{
  hardware = {
    i2c.enable = true;
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        vpl-gpu-rt          # for newer GPUs on NixOS >24.05 or unstable
      ];
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = true;
        };
      };
    };
  };
}
