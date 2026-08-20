
-- Keybindings - Catppuccin Mocha
-- See https://wiki.hypr.land/Configuring/Basics/Binds/

local mainMod = "SUPER"
local terminal = "alacritty"
local fileManager = "thunar"
local menu = "wofi --show drun"
local browser = "chromium"
local clipboard = "wofi --show clipboard -modi clipboard --show-icons"

-- Close
hl.bind(mainMod .. " + C", hl.dsp.window.close())

-- Terminal
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))

-- App launcher (SUPER+R)
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))

-- App launcher (CTRL+R)
hl.bind("CTRL + R", hl.dsp.exec_cmd(menu))

-- File manager
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))

-- Browser
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))

-- Clipboard
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(clipboard))

-- Power menu
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("wlogout"))

-- Float toggle
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))

-- Pseudo
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

-- Toggle split
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- Toggle special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Focus (arrows)
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Focus (vim)
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

-- Move windows (arrows)
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

-- Move windows (vim)
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.move({ direction = "down" }))

-- Resize windows (arrows)
hl.bind(mainMod .. " + CTRL + left",  hl.dsp.exec_cmd("hyprctl dispatch resizeactive -40 0"))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 40 0"))
hl.bind(mainMod .. " + CTRL + up",    hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 -40"))
hl.bind(mainMod .. " + CTRL + down",  hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 40"))

-- Resize windows (vim)
hl.bind(mainMod .. " + CTRL + h", hl.dsp.exec_cmd("hyprctl dispatch resizeactive -40 0"))
hl.bind(mainMod .. " + CTRL + l", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 40 0"))
hl.bind(mainMod .. " + CTRL + k", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 -40"))
hl.bind(mainMod .. " + CTRL + j", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 40"))

-- Switch workspaces [1-10]
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
    hl.bind(mainMod .. " + CTRL + " .. key, hl.dsp.window.move({ workspace = i, follow = true }))
    hl.bind(mainMod .. " + SHIFT + CTRL + " .. key, hl.dsp.window.move({ workspace = i, follow = true, retainvisible = true }))
end

-- Create/switch workspaces with CTRL+SHIFT+[1-0]
for i = 1, 10 do
    local key = i % 10
    hl.bind("CTRL + SHIFT + " .. key, hl.dsp.focus({ workspace = i }))
end

-- Scroll through workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/Resize with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Screenshot
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("hyprshot -m region -- - | wl-copy"), { locked = true })
hl.bind("Print",          hl.dsp.exec_cmd("hyprshot -m output -- - | wl-copy"), { locked = true })
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("hyprshot -m window -- - | wl-copy"), { locked = true })

-- Clipboard manager
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd("cliphist list | wofi --dmenu | cliphist decode | wl-copy"))

-- Fullscreen
hl.bind(mainMod .. " + F11", hl.dsp.window.fullscreen())

-- Toggle floating
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))

-- Pin window
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.window.pin())

-- Move to named workspace
hl.bind(mainMod .. " + ALT + 1", hl.dsp.window.move({ workspace = "name:dev" }))
hl.bind(mainMod .. " + ALT + 2", hl.dsp.window.move({ workspace = "name:chat" }))
hl.bind(mainMod .. " + ALT + 3", hl.dsp.window.move({ workspace = "name:media" }))
hl.bind(mainMod .. " + ALT + 4", hl.dsp.window.move({ workspace = "name:gaming" }))

-- Volume controls
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"),     { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),             { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),            { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),          { locked = true, repeating = true })

-- Brightness controls
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),   { locked = true, repeating = true })

-- Media controls
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Lock screen
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("hyprlock"))

-- Toggle screen shader
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("hyprctl keyword screen_shader ''"))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("hyprctl keyword screen_shader 'glsl:$HOME/.config/hypr/shader.frag'"))
