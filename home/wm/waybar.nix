# home/wm/waybar.nix
{ config, lib, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;  # Recommended for systemd integration
    
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 4;
        
        modules-left = ["hyprland/mode" "hyprland/window"];
        modules-center = ["hyprland/workspaces"];
        modules-right = ["pulseaudio" "network" "group/hardware" "temperature" "battery" "tray" "clock"];
        
        "hyprland/workspaces" = {
          format = "{name}";
          all-outputs = true;
          disable-scroll = false;
          on-scroll-up = "hyprctl dispatch workspace -1";
          on-scroll-down = "hyprctl dispatch workspace +1";
        };
        
        "hyprland/window" = {
          max-length = 50;
          separate-outputs = true;
        };
        
        tray = {
          spacing = 5;
        };
        
        clock = {
          format = "{:%H:%M:%S}";
          format-alt = "{:%Y-%m-%d}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          interval = 5;
        };
        
        cpu = {
          format = " {usage}% ";
          tooltip = true;
        };
        
        memory = {
          format = "   {}% ";
	  tooltip = true;
        };

	disk = {
	  format = "  {specific_free:0.2f} Gb";
	  unit = "GB";
	  tooltip = true;
	};
        
        temperature = {
          thermal-zone = 2;
          hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
          critical-threshold = 80;
          format = "{icon} {temperatureC}°C";
          format-icons = ["" "" ""];
        };
        
	"group/hardware" = {
	  orientation = "horizontal";
	  modules = [
	    "cpu"
	    "disk"
	    "memory"
	  ];
	};

        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{icon} {time}";
          format-icons = [" " " " " " " " " "];
        };
        
        network = {
          format-wifi = "  {essid} ({signalStrength}%)";
          format-ethernet = "Connected  ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };
        
        pulseaudio = {
          format = "  {volume}%";
          format-bluetooth = "{icon} {volume}% {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = "x";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
          on-click = "pavucontrol";
        };
      };
    };
    
    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: Mononoki Nerd Font;
        font-size: 13px;
        min-height: 0;
      }
      
      window#waybar {
        background-color: rgba(43, 48, 59, 0.0);
        border-bottom: 3px solid rgba(100, 114, 125, 0.0);
        color: #fafafa;
        transition-property: background-color;
        transition-duration: .5s;
      }
      
      window#waybar.hidden {
        opacity: 0.0;
      }
      
      #workspaces {
	background: #151010;
	margin: 5px 5px 5px 5px;
	padding: 4px 1px;
	border-radius: 12px;
	font-weight: normal;
	font-style: normal;
	opacity: 1;
      }

      #workspaces button {
        padding: 0px 5px;
	margin: 0px 3px;
	border-radius: 12px;
	color: #fdf4dc;
	background-color: #040404;
	transition: all 0.3s ease;
	opacity: 0.5;
      }
      
      #workspaces button.active {
        color: #000000;
	font-weight: bold;
	background-color: #ffffff;

      }

      #workspaces button:hover {
        background: #ffffff;
        box-shadow: inset 0 -3px #ffffff;
      }
      
      #mode {
        background-color: #64727D;
      }
      
      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #network,
      #pulseaudio,
      #custom-media,
      #tray,
      #mode,
      #window,
      #idle_inhibitor {
        padding: 1px 12px 1px 12px;
        margin: 2px;
	background-color: #000000;
	color: #fdf4dc;
	border-radius: 20px;
	opacity: 0.8;
      }
      
      #clock {
	background-color: #000000;
	color: #fdf4dc;
      }
      
      #battery {
	background-color: #000000;
	color: #fdf4dc;
      }
      
      #battery.charging, #battery.plugged {
        color: #ffffff;
        background-color: #26A65B;
      }
      
      @keyframes blink {
        to {
          background-color: #ffffff;
          color: #000000;
        }
      }
      
      #battery.critical:not(.charging) {
        background-color: #f53c3c;
        color: #ffffff;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }
      
      #cpu {
	background-color: #000000;
	color: #fdf4dc;
      }
      
      #memory {
	background-color: #000000;
	color: #fdf4dc;
      }
      
      #network {
	background-color: #000000;
	color: #fdf4dc;
      }
      
      #network.disconnected {
	background-color: #000000;
	color: #fdf4dc;
      }
      
      #pulseaudio {
	background-color: #000000;
	color: #fdf4dc;
      }
      
      #pulseaudio.muted {
        background-color: #d3b1b1;
        color: #2a5c45;
      }
      
      #temperature {
	background-color: #000000;
	color: #fdf4dc;
      }
      
      #temperature.critical {
        background-color: #ff2222;
      }
      
      #tray {
        background-color: #2980b9;
      }
    '';
  };
}
