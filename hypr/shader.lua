
-- Screen Shader
-- Applies a subtle vignette + color correction effect
-- Place this GLSL shader at ~/.config/hypr/shader.frag

local home = os.getenv("HOME") or "~"

hl.config({
    screen_shader = "glsl:" .. home .. "/.config/hypr/shader.frag",
})
