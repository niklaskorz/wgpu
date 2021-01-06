#version 450

layout(location=0) in vec3 in_pos;
layout(location=1) in vec2 in_tex_coords;

layout(location=0) out vec2 out_tex_coords;

layout(set=1, binding=0) uniform Uniforms {
    mat4 u_view_proj;
    mat4 u_model_view;
};

void main() {
    gl_Position = u_view_proj * u_model_view * vec4(in_pos, 1.0);
    out_tex_coords = in_tex_coords;
}
