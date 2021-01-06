#version 450

layout(location=0) in vec2 in_tex_coords;
layout(location=0) out vec4 out_color;

layout(set=0, binding=0) uniform texture2D t_diffuse;
layout(set=0, binding=1) uniform sampler s_diffuse;

void main() {
    out_color = texture(sampler2D(t_diffuse, s_diffuse), in_tex_coords);
}
