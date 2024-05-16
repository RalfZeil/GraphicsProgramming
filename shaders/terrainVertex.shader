#version 330 core
layout(location = 0) in vec3 vPos;
layout(location = 1) in vec3 vNormal;
layout(location = 2) in vec2 vUV;

out vec2 uv;
out vec3 normal;
out vec4 worldPosition;

uniform mat4 world, view, projection;

void main()
{
	gl_Position = projection * view * world * vec4(vPos, 1.0);
	uv = vUV;
	normal = vNormal;

	worldPosition = world * vec4(vPos, 1.0);
}