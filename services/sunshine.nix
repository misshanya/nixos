{ ... }:

{
  hardware.uinput.enable = true;
  users.users.mishanya.extraGroups = [ "uinput" ];

  services.sunshine = {
    enable = true;
    capSysAdmin = true;
    openFirewall = true;
  };
}
