{ ... }:
{
  boot.kernel.sysctl = {
    "vm.swappiness" = 150;
    "vm.page-cluster" = 0;
    "vm.min_free_kbytes" = 262144;
    "vm.oom_kill_allocating_task" = 1;
    "vm.vfs_cache_pressure" = 50;
  };
}
