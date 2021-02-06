#version 450

layout(location=0) in vec3 in_pos;
layout(location=1) in vec2 in_tex_coords;

layout(location=5) in vec4 in_model_view_1;
layout(location=6) in vec4 in_model_view_2;
layout(location=7) in vec4 in_model_view_3;
layout(location=8) in vec4 in_model_view_4;

layout(location=0) out vec2 out_tex_coords;

layout(set=1, binding=0) uniform Uniforms {
    mat4 u_view_proj;
    mat4 u_model_view;
};

void main() {
    mat4 in_model_view = mat4(in_model_view_1, in_model_view_2, in_model_view_3, in_model_view_4);
    gl_Position = u_view_proj * in_model_view * vec4(in_pos, 1.0);
    out_tex_coords = in_tex_coords;
}
