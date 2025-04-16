{
  settings = {
    monitor = [
      ",preferred, auto, 1.25"
    ];
    xwayland = {
      force_zero_scaling = true;
    };
    dwindle = {
      preserve_split = true;
      smart_split = false;
      smart_resizing = false;
    };
    input = {
      kb_layout = "us";
      numlock_by_default = true;
      repeat_delay = 240;
      repeat_rate = 50;
      force_no_accel = false;
      sensitivity = -0.15;
      #sensitivity=0.6
      accel_profile = "flat";

      touchpad = {
        natural_scroll = true;
        disable_while_typing = true;
        clickfinger_behavior = true;
        scroll_factor = 0.5;
      };
      special_fallthrough = true;
      follow_mouse = true;
    };
    general = {
      layout = "dwindle";
      gaps_in = 5;
      gaps_out = 18;
      border_size = 5;

      resize_on_border = false;
      no_focus_fallback = true;
      allow_tearing = true;
    };
    binds = {
      scroll_event_delay = 0;
    };
    gestures = {
      workspace_swipe = true;
      workspace_swipe_distance = 700;
      workspace_swipe_fingers = 4;
      workspace_swipe_cancel_ratio = 0.2;
      workspace_swipe_min_speed_to_force = 5;
      workspace_swipe_direction_lock = true;
      workspace_swipe_direction_lock_threshold = 10;
      workspace_swipe_create_new = true;
    };
    decoration = {
      rounding = 20;
      #multisample_edges = true
      #active_opacity = 1
      inactive_opacity = 0.97;

      blur = {
        enabled = true;
        special = false;
        new_optimizations = "on";
        size = 5;
        passes = 4;
        brightness = 1;
        noise = 0.01;
        ignore_opacity = true;
      };

      shadow = {
        enabled = true;
        ignore_window = true;
        range = 20;
        offset = "0 2";
        render_power = 4;
        color = "rgba(0000002A)";
      };
      dim_inactive = false;
      dim_strength = 0.1;
      dim_special = 0;
    };
    animations = {
      enabled = true;
      bezier = [
        "myBezier, 0.05, 0.9, 0.1, 1.05"
        "myBezier2, 0.65, 0, 0.35, 1"
        "linear, 0, 0, 1, 1"
        "slow,0,0.85,0.3,1"
        "overshot,0.7,0.6,0.1,1.1"
        "bounce,1,1.6,0.1,0.85"
        "slingshot,1,-1,0.15,1.25"
        "nice,0,6.9,0.5,-4.20"
      ];
      # animation = [
      #     "windows,1,5,bounce,popin"
      #     "border,1,20,default"
      #     "fade, 1, 5, overshot"
      #     "workspaces, 1, 4.5, overshot, slidevert"
      #     "windowsIn,1,5,slow,popin"
      #     "windowsMove,1,5,default"
      # ];
      animation = [
        "windows,1,5,bounce,popin"
        "border,1,20,default"
        "fade, 1, 5, overshot"
        "workspaces, 1, 6, overshot, slide"
        "windowsIn,1,5,slow,popin"
        "windowsMove,1,5,default"
      ];
    };

    # animations {
    #     enabled = yes
    #     bezier = myBezier, 0.05, 0.9, 0.1, 1.05
    #     bezier = myBezier2, 0.65, 0, 0.35, 1
    #     bezier = linear, 0, 0, 1, 1
    #
    #     bezier=slow,0,0.85,0.3,1
    #     bezier=overshot,0.7,0.6,0.1,1.1
    #     bezier=bounce,1,1.6,0.1,0.85
    #     bezier=slingshot,1,-1,0.15,1.25
    #     bezier=nice,0,6.9,0.5,-4.20
    #
    # }
    misc = {
      animate_mouse_windowdragging = true;
      vfr = 1;
      vrr = 1;
      # layers_hog_mouse_focus = true
      focus_on_activate = true;
      animate_manual_resizes = false;
      enable_swallow = false;
      swallow_regex = "(foot|kitty|allacritty|Alacritty)";

      disable_hyprland_logo = true;
      force_default_wallpaper = 0;
      new_window_takes_over_fullscreen = 2;
      initial_workspace_tracking = false;
    };
  };
}
