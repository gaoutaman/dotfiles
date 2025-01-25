{...}: {
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      position = "top";
      layer = "top";
      height = 28;
      margin-top = 0;
      margin-bottom = 0;
      margin-left = 0;
      margin-right = 0;
      modules-left = [
        "hyprland/workspaces"
        "tray"
      ];
      modules-center = ["clock" "hyprland/window"];
      modules-right = [
        "cpu"
        "memory"
        "disk"
        "pulseaudio"
        "network"
        "battery"
        "custom/notification"
      ];
      clock = {
        calendar = {
          format = {
            today = "<span color='#98971A'><b>{}</b></span>";
          };
        };
        format = "  {:%H:%M}";
        tooltip = "true";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format-alt = "  {:%d/%m}";
      };
      "hyprland/workspaces" = {
        active-only = false;
        disable-scroll = true;
        format = "{icon}";
        on-click = "activate";
        format-icons = {
          "1" = "1";
          "2" = "2";
          "3" = "3";
          "4" = "4";
          "5" = "5";
          "6" = "6";
          "7" = "7";
          "8" = "8";
          "9" = "9";
          "10" = "10";
          sort-by-number = true;
        };
        persistent-workspaces = {
          "1" = [];
          "2" = [];
          "3" = [];
          "4" = [];
          "5" = [];
        };
        "hyprland/window" = {
          "separate-outputs" = true;
        };
      };
      cpu = {
        format = "  {usage}%";
        format-alt = "  {avg_frequency} GHz";
        interval = 2;
        on-click-right = "wezterm start --btop";
      };
      memory = {
        format = "󰟜 {}%";
        format-alt = "󰟜 {used} GiB"; # 
        interval = 2;
        on-click-right = "wezterm start --btop";
      };
      disk = {
        format = "󰋊 {percentage_used}%";
        interval = 60;
        on-click-right = "wezterm start --btop";
      };
      network = {
        format-wifi = "  {signalStrength}%";
        format-ethernet = "󰀂 ";
        tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
        format-linked = "{ifname} (No IP)";
        format-disconnected = "󰖪 ";
      };
      tray = {
        icon-size = 20;
        spacing = 8;
      };
      pulseaudio = {
        format = "{icon} {volume}%";
        format-muted = "  {volume}%";
        format-icons = {
          default = [" "];
        };
        scroll-step = 2;
        on-click = "pavucontrol";
      };
      battery = {
        format = "{icon} {capacity}%";
        format-icons = [
          " "
          " "
          " "
          " "
          " "
        ];
        format-charging = " {capacity}%";
        format-full = " {capacity}%";
        format-warning = " {capacity}%";
        interval = 5;
        states = {
          warning = 20;
        };
        format-time = "{H}h{M}m";
        tooltip = true;
        tooltip-format = "{time}";
      };
      "custom/notification" = {
        tooltip = false;
        format = "{icon} ";
        format-icons = {
          notification = "<span foreground='red'><sup></sup></span>  <span foreground='red'></span>";
          none = "  <span foreground='red'></span>";
          dnd-notification = "<span foreground='red'><sup></sup></span>  <span foreground='red'></span>";
          dnd-none = "  <span foreground='red'></span>";
          inhibited-notification = "<span foreground='red'><sup></sup></span>  <span foreground='red'></span>";
          inhibited-none = "  <span foreground='red'></span>";
          dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>  <span foreground='red'></span>";
          dnd-inhibited-none = "  <span foreground='red'></span>";
        };
        return-type = "json";
        exec-if = "which swaync-client";
        exec = "swaync-client -swb";
        on-click = "swaync-client -t -sw";
        on-click-right = "swaync-client -d -sw";
        escape = true;
      };
    };
  };
}
