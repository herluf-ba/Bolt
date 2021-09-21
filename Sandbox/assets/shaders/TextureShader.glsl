// Basic texture shader

#type vertex
#version 330 core
			
uniform mat4 u_ViewProjection;
uniform mat4 u_Transform;
layout(location = 0) in vec3 a_Position;
layout(location = 1) in vec2 a_TexCoord;
out vec2 v_TexCoord;

void main() {
	gl_Position = u_ViewProjection * u_Transform * vec4(a_Position, 1.0);
	v_TexCoord = a_TexCoord;
}

#type fragment
#version 330 core
			
uniform sampler2D u_Texture;
in vec2 v_TexCoord;
layout(location = 0) out vec4 o_Color;

void main() {
	o_Color = texture(u_Texture, v_TexCoord);
}
