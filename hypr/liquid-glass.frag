/*
 * Liquid Glass Shader for Hyprland
 * Per-window shader for Alacritty terminal
 * Mimics macOS Sequoia glassmorphism / liquid glass effect
 *
 * Place at: ~/.config/hypr/liquid-glass.frag
 * Use with: windowrule = ..., shader: ~/.config/hypr/liquid-glass.frag
 */

precision mediump float;
varying vec2 v_texCoord;
uniform sampler2D tex;
uniform float time;
uniform vec2 resolution;

float hash(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453123);
}

float noise(vec2 p) {
    vec2 i = floor(p);
    vec2 f = fract(p);
    f = f * f * (3.0 - 2.0 * f);
    float a = hash(i);
    float b = hash(i + vec2(1.0, 0.0));
    float c = hash(i + vec2(0.0, 1.0));
    float d = hash(i + vec2(1.0, 1.0));
    return mix(mix(a, b, f.x), mix(c, d, f.x), f.y);
}

float fbm(vec2 p) {
    float value = 0.0;
    float amplitude = 0.5;
    for (int i = 0; i < 4; i++) {
        value += amplitude * noise(p);
        p *= 2.0;
        amplitude *= 0.5;
    }
    return value;
}

void main() {
    vec2 uv = v_texCoord;
    vec2 centered = uv - 0.5;

    // Liquid distortion - organic flowing movement
    float t = time * 0.3;
    float distortStrength = 0.012;
    vec2 flowOffset = vec2(
        fbm(uv * 4.0 + vec2(t * 0.7, t * 0.3)) - 0.5,
        fbm(uv * 4.0 + vec2(t * 0.2, t * 0.6) + 10.0) - 0.5
    ) * distortStrength;

    // Edge refraction - light bending at the edges
    float edgeDist = length(centered);
    float edgeFactor = smoothstep(0.2, 0.7, edgeDist);
    vec2 refractionOffset = normalize(centered + 0.001) * edgeFactor * 0.015;
    vec2 distortedUV = uv + flowOffset + refractionOffset;

    // Chromatic aberration - color channel separation
    float chromaStrength = 0.003 + edgeFactor * 0.005;
    float r = texture2D(tex, distortedUV + vec2(chromaStrength, 0.0)).r;
    float g = texture2D(tex, distortedUV).g;
    float b = texture2D(tex, distortedUV - vec2(chromaStrength, 0.0)).b;
    vec3 color = vec3(r, g, b);

    // Glass tint - cool blue-purple Catppuccin match
    vec3 tint = vec3(0.54, 0.71, 0.98); // Mocha Blue
    float tintStrength = 0.08 + edgeFactor * 0.12;
    color = mix(color, color * tint, tintStrength);

    // Frosted glass noise texture
    float frost = fbm(uv * 20.0 + t * 0.5) * 0.03;
    color += frost;

    // Specular highlight - glossy reflection at top-left
    vec2 lightDir = normalize(vec2(-0.4, -0.5));
    float specular = pow(max(dot(normalize(centered), lightDir), 0.0), 8.0);
    specular *= edgeFactor * 0.15;
    color += vec3(specular);

    // Secondary highlight - bottom-right subtle rim light
    vec2 rimLight = normalize(vec2(0.5, 0.6));
    float rim = pow(max(dot(normalize(centered), rimLight), 0.0), 12.0);
    rim *= edgeFactor * 0.06;
    color += vec3(0.6, 0.75, 1.0) * rim;

    // Edge glow - luminous border effect
    float edgeGlow = smoothstep(0.45, 0.5, edgeDist) * 0.15;
    vec3 glowColor = vec3(0.54, 0.71, 0.98); // Blue
    vec3 glowColor2 = vec3(0.79, 0.65, 0.97); // Mauve
    float glowMix = sin(t * 2.0) * 0.5 + 0.5;
    color += mix(glowColor, glowColor2, glowMix) * edgeGlow;

    // Vignette - subtle darkening at corners
    float vignette = 1.0 - smoothstep(0.3, 0.85, edgeDist) * 0.3;
    color *= vignette;

    // Brightness compensation
    color *= 1.05;

    gl_FragColor = vec4(color, 1.0);
}
