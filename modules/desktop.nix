{ config, pkgs, ... }:

{
  # Hyprland configuration
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # X11 and Display settings
  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    xkb = {
      layout = "gb";
      variant = "";
    };
  };

  # Desktop environment packages
  environment.systemPackages = with pkgs; [
    waybar
#    mako
    swww
    kitty
    rofi-wayland
    brightnessctl
    networkmanagerapplet

    # Create the nvidia-offload script
    (pkgs.writeShellScriptBin "nvidia-offload" ''
      export __NV_PRIME_RENDER_OFFLOAD=1
      export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
      export __GLX_VENDOR_LIBRARY_NAME=nvidia
      export __VK_LAYER_NV_optimus=NVIDIA_only
      exec "$@"
    '')
  ];

  # Wayland/Graphics configuration
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    graphics.enable = true;
  };

     # Disable the default nouveau driver and use NVIDIA proprietary driver
  services.xserver.videoDrivers = [ "nvidia" ];
  
  # Blacklist nouveau driver explicitly
  boot.blacklistedKernelModules = [ "nouveau" ];

  hardware.nvidia = {
    modesetting.enable = true;

  # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    open = false;

    # Enable the Nvidia settings menu,
	# accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
# Wrap the executable in the following script to deal with GPU offloading
#
#export __NV_PRIME_RENDER_OFFLOAD=1
#export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
#export __GLX_VENDOR_LIBRARY_NAME=nvidia
#export __VK_LAYER_NV_optimus=NVIDIA_only
#exec "$@"
#      
 offload = {
			enable = true;
			enableOffloadCmd = true;
		};
		# Make sure to use the correct Bus ID values for your system!
		intelBusId = "PCI:0:2:0";
		nvidiaBusId = "PCI:01:0:0";
                # amdgpuBusId = "PCI:54:0:0"; For AMD GPU
	};

  };


  # XDG Portal
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };
}
