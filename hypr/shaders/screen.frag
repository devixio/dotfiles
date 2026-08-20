/*
 * CRT-like screen shader for Hyprland
 * Adds subtle scanlines + vignette + slight curve
 *
 * Place in ~/.config/hypr/shaders/screen.frag
 * Use with: decoration:screen_shader = ~/.config/hypr/shaders/screen.frag
 */

precision mediump float;
varying vec2 v_texCoord;
uniform sampler2D tex;
uniform float time;
uniform vec2 resolution;

float scanline(float y, float speed, float brightness) {
    return sin(y * resolution.y * 1.0 + time * speed) * 0.04 * brightness;
}

float vignette(vec2 uv, float radius, float softness) {
    float d = distance(uv, vec2(0.5));
    return smoothstep(radius, radius - softness, d);
}

float noise(vec2 p) {
    return fract(sin(dot(p, vec2(12.9898, 78.233))) * 43758.5453);
}

void main() {
    vec2 uv = v_texCoord;

    // Slight barrel distortion
    vec2 centered = uv - 0.5;
    float dist = dot(centered, centered);
    uv += centered * dist * 0.04;

    // Chromatic aberration
    float aberration = 0.001;
    float r = texture2D(tex, vec2(uv.x + aberration, uv.y)).r;
    float g = texture2D(tex, uv).g;
    float b = texture2D(tex, vec2(uv.x - aberration, uv.y)).b;
    vec3 color = vec3(r, g, b);

    // Scanlines
    color -= scanline(uv.y, 2.0, 1.0);

    // Subtle film grain
    float grain = noise(uv * resolution + time * 100.0) * 0.06;
    color += grain;

    // Vignette
    float vig = vignette(uv, 0.75, 0.45);
    color *= vig;

    // Slight brightness boost to compensate
    color *= 1.05;

    gl_FragColor = vec4(color, 1.0);
}
