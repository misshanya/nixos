{ ... }:
{
  nix.distributedBuilds = true;
  nix.buildMachines = [
    {
      hostName = "192.168.2.128";
      system = "x86_64-linux";
      sshUser = "mishanya";
      sshKey = "/home/mishanya/.ssh/id_ed25519";
      maxJobs = 8;
    }
  ];
  nix.settings.builders-use-substitutes = true;
}
