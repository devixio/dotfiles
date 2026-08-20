precision mediump float;
varying vec2 v_texCoord;
uniform sampler2D tex;

void main() {
    vec4 color = texture2D(tex, v_texCoord);

    // Subtle vignette effect
    vec2 uv = v_texCoord;
    float dist = distance(uv, vec2(0.5, 0.5));
    float vignette = smoothstep(0.8, 0.4, dist);
    color.rgb = mix(color.rgb * 0.7, color.rgb, vignette);

    // Subtle color warm-up
    color.r *= 1.01;
    color.b *= 0.99;

    // Slight contrast boost
    color.rgb = pow(color.rgb, vec3(0.98));

    gl_FragColor = color;
}
