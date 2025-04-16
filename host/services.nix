{
  services = {
    udisks2.enable = true;
    upower.enable = true;
    daed = {
      enable = true;
      openFirewall = {
        enable = true;
        port = 12345;
      };
    };
  };
}
