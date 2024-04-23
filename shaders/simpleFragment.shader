#version 330 core
out vec4 FragColor;

in vec3 color;

void main()
{
	FragColor = vec4(color, 1.0f); //vec4(0.5f, 0.8f, 0.4f, 1.0f);
}