#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoords;
layout (location = 3) in vec2 aTexCoords2;

out vec2 TexCoords;
out vec2 TexCoords2;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

void main()
{
    //TexCoords = aTexCoords;    
    TexCoords2 = aTexCoords2;

    vec4 orgP = vec4(aTexCoords.x * 2.0 - 1.0, aTexCoords.y * 2.0 - 1.0, 0.5, 1.0);
    vec4 o = orgP * 0.5;
    
    TexCoords = vec2(o.x, o.y) + o.w;
    //vec2 v = orgP.xy * 0.5f; 
    //o.xy = float2(o.x, o.y*_ProjectionParams.x) + o.w;
    //o.zw = pos.zw;

    //o.uv = ComputeScreenPos(orgP);
    //o.vertex = float4(TexCoords2.x * 2.0 - 1.0, TexCoords2 * 2.0 - 1.0, 0.5, 1.0);

    gl_Position = vec4(TexCoords2.x * 2.0 - 1.0, TexCoords2.y * 2.0 - 1.0, 0.5, 1.0);//projection * view * model * vec4(aPos, 1.0);
}