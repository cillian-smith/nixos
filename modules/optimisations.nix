{
  config,
  lib,
  pkgs,
  ...
}: {
  # NetworkManager wait-online optimization
  systemd.services.NetworkManager-wait-online = {
    serviceConfig = {
      ExecStart = ["" "${pkgs.networkmanager}/bin/nm-online -q -t 2"];
    };
  };

  # Docker service optimization
  systemd.services.docker = {
    wantedBy = lib.mkForce []; # Remove from default target
    serviceConfig = {
      # Start on-demand instead of at boot
      StartLimitBurst = 0;
    };
  };

  # Nixos-upgrade optimization
  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    dates = "weekly"; # Check weekly instead of at each boot
  };

  # PowerTOP optimization (if you need to keep it)
  #  systemd.services.powertop = {
  #   after = ["graphical.target"];
  #  wantedBy = lib.mkForce ["multi-user.target"];
  # };

  # Kernel and I/O optimizations
  boot.kernel.sysctl = {
    "vm.swappiness" = 10;
    "vm.max_readahead" = 2048;
  };

  # I/O scheduler optimization
  services.udev.extraRules = ''
    # SSD optimization
    ACTION=="add|change", KERNEL=="sd[a-z]", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="none"
    # HDD optimization
    # ACTION=="add|change", KERNEL=="sd[a-z]", ATTR{queue/rotational}=="1", ATTR{queue/scheduler}="bfq"
  '';

  # Tmp directory optimization
  fileSystems."/tmp" = {
    device = "tmpfs";
    fsType = "tmpfs";
    options = ["nosuid" "nodev" "relatime" "size=2G"];
  };
}
