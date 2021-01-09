[[block]]
struct Uniforms {
    [[offset(0)]] view_proj: mat4x4<f32>;
    [[offset(64)]] model_view: mat4x4<f32>;
};
[[group(1), binding(0)]]
var u: Uniforms;

[[location(0)]]
var<in> in_pos: vec3<f32>;
[[location(1)]]
var<in> in_tex_coords: vec2<f32>;
[[location(0)]]
var<out> out_tex_coords: vec2<f32>;
[[builtin(position)]]
var<out> out_pos: vec4<f32>;

[[stage(vertex)]]
fn vs_main() {
    out_tex_coords = in_tex_coords;
    out_pos = u.view_proj * u.model_view * vec4<f32>(in_pos.x, in_pos.y, in_pos.z, 1.0);
    #out_pos = vec4<f32>(in_pos.x, in_pos.y, in_pos.z, 1.0);
}

[[group(0), binding(0)]]
var t_diffuse: texture_2d<f32>;
[[group(0), binding(1)]]
var s_diffuse: sampler;

[[location(0)]]
var<in> in_tex_coords: vec2<f32>;
[[location(0)]]
var<out> out_color: vec4<f32>;

[[stage(fragment)]]
fn fs_main() {
    out_color = textureSample(t_diffuse, s_diffuse, in_tex_coords);
}
