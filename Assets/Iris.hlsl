#include "Packages/jp.keijiro.noiseshader/Shader/SimplexNoise2D.hlsl"

void Iris_float(float2 uv, float3 c1, float3 c2, out float4 output)
{
    float t = _Time.y;

    float2 p = (uv - 0.5) / 0.26;
    float l = length(p);
    float phi = atan2(p.x, p.y) / (PI * 2) + 0.5;

    float r = 0.35 + 0.1 * sin(t * 4);

    float gc1 = snoise(float2(phi * 20, t));

    //c2 = HsvToRgb(float3(frac(t + phi * 0.3), 1, 1));
    c1 = HsvToRgb(float3(frac(gc1 * 0.1 + t * 0.2), 1, 1));
    c2 = c1;// * 0.1;

    float3 gc2 = lerp(c1, c2, gc1 + 0.5);

    float gcp = (l - 0.5) / 0.5;
    gcp = gcp * gcp;

    gc2 = lerp(gc2, 0.5, gcp);

    float3 c = 0;
    c = lerp(c, gc2, smoothstep(r, r + 0.01, l));
    c = lerp(c, 1, smoothstep(1, 1.1, l));

    output = float4(c, 1);
}
