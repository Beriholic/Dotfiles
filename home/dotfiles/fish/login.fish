function st_hypr
    set -gx LANG zh_CN.UTF-8
    exec Hyprland
end

function st_niri
    set -gx LANG zh_CN.UTF-8
    exec niri
end

if test (tty) = "/dev/tty1"
   st_hypr
else if test (tty) = "/dev/tty2"
   st_niri
end


