#version 330 core
layout(location = 0) in vec3 vPos;
layout(location = 1) in vec3 vColor;
layout(location = 2) in vec2 vUV;
layout(location = 3) in vec3 vNormal;
layout(location = 4) in vec3 vTangents;
layout(location = 5) in vec3 vBitangents;

out vec3 color;
out vec2 uv;
out mat3 tbn;
out vec4 worldPosition;

uniform mat4 world, view, projection;

void main()
{
	gl_Position = projection * view * world * vec4(vPos, 1.0);

	color = vColor;
	uv = vUV;

	vec3 T = normalize(mat3(world) * vTangents);
	vec3 B = normalize(mat3(world) * vBitangents);
	vec3 N = normalize(mat3(world) * vNormal);
	tbn = mat3(T, B, N);

	worldPosition = world * vec4(vPos, 1.0);
}