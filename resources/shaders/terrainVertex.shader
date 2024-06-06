#version 330 core
layout(location = 0) in vec3 vPos;
layout(location = 1) in vec3 vNormal;
layout(location = 2) in vec2 vUV;

out vec2 uv;
out vec4 worldPosition;

uniform mat4 world, view, projection;

uniform sampler2D mainTex;

void main()
{
	vec3 pos = vPos;
	// object space offset

	vec4 worldPos = world * vec4(pos, 1.0);
	// World pos offsets
	worldPos.y += texture(mainTex, vUV).r * 100.0f;


	gl_Position = projection * view * world * vec4(worldPos);
	uv = vUV;

	worldPosition = world * vec4(vPos, 1.0);
}