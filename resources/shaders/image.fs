#version 330 core
out vec4 FragColor;

in vec2 fragCoord;

uniform sampler2D _MainTex;
uniform float brightnessThreshold;

void main()
{ 
    vec4 texColor = texture(_MainTex, fragCoord);

    // Calculate luminance of the pixel 
    float luminance = dot(texColor.rgb, vec3(0.2126, 0.7152, 0.0722));

    // Check if the pixel is brighter than the threshold
    if (luminance > brightnessThreshold)
    {
        FragColor = texColor;
    }
    else
    {
        FragColor = vec4(0.0);
    }
}