#!/usr/bin/env bash
get_light_dark() {
    lightdark=""
    if [ ! -f "$HOME"/.cache/ags/user/colormode.txt ]; then
        echo "dark" > "$HOME"/.cache/ags/user/colormode.txt
    else
        lightdark=$(sed -n '1p' "$HOME/.cache/ags/user/colormode.txt")
    fi
    echo "$lightdark"
}

lightdark=$(get_light_dark)

if [ "$lightdark" = "light" ]; then
    sed  -i  '1,1s/light/dark/g' "$HOME/.cache/ags/user/colormode.txt"
else
    sed  -i  '1,1s/dark/light/g' "$HOME/.cache/ags/user/colormode.txt"
fi



color=$(cut -f1 "${HOME}/.cache/ags/user/color.txt")

# Generate colors for ags n stuff
"$HOME"/.config/ags/scripts/color_generation/colorgen.sh "${color}" --apply
