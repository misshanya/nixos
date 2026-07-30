{ ... }:
{
  nix.distributedBuilds = true;
  nix.buildMachines = [
    {
      hostName = "100.96.10.1";
      system = "x86_64-linux";
      sshUser = "mishanya";
      sshKey = "/home/mishanya/.ssh/id_ed25519";
      maxJobs = 8;
    }
  ];
  nix.settings.builders-use-substitutes = true;
}
