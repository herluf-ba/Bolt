#type vertex
#version 330 core
			
uniform mat4 u_ViewProjection;

layout(location = 0) in vec3 a_Position;
layout(location = 1) in vec4 a_Tint;
layout(location = 2) in vec2 a_TexCoords;
layout(location = 3) in float a_TexId;

out vec4  v_Tint;
out vec2  v_TexCoords;
out float v_TexId;

void main() {
	gl_Position = u_ViewProjection * vec4(a_Position, 1.0);

	v_Tint      = a_Tint;
	v_TexCoords = a_TexCoords;
	v_TexId     = a_TexId;
}

#type fragment
#version 330 core

uniform sampler2D u_Textures[32];

in vec4  v_Tint;
in vec2  v_TexCoords;
in float v_TexId;

layout(location = 0) out vec4 o_Color;

void main() {
	o_Color = v_Tint * texture(u_Textures[int(v_TexId)], v_TexCoords);
}
