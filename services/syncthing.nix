{ ... }:

{
  services.syncthing = {
    enable = true;
    group = "users";
    user = "mishanya";
    dataDir = "/home/mishanya/Documents";
    configDir = "/home/mishanya/Documents/.config/syncthing";
  };
}
