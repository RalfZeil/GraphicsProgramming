#version 330 core
out vec4 FragColor;

in vec4 worldPosition;

uniform vec3 cameraPosition;
uniform vec3 lightDirection;
uniform samplerCube cubeMap;

vec3 lerp(vec3 a, vec3 b, float t) {
    return a + (b - a) * t;
}

void main()
{
    vec3 sunColor = vec3(0.9, 0.9, 1.0) * 1.2;

    // Calculate View
    vec3 viewDir = normalize(worldPosition.rgb - cameraPosition);
    float sun = max(pow(dot(-viewDir, lightDirection), 2048), 0.0);

    vec4 cubeMapColor = texture(cubeMap, viewDir);

    FragColor = cubeMapColor + vec4(sun * sunColor, 1);
}
