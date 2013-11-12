//
// xygthop3's Refraction shader(HLSL9) Vertex
//
struct SInput { //in from attributes to vertex
    float4 Position : POSITION;
    float4 Normal   : NORMAL;
    float4 Colour   : COLOR0;
    float2 Texcoord : TEXCOORD0;
};
  
struct SOutput { //out from vertex to pixel
    float4 Position : POSITION;
    float4 Colour   : COLOR0;
    float4 Colour1   : COLOR1;
    float4 Colour2   : COLOR2;    
    float2 Texcoord : TEXCOORD0;
};


void main(in SInput IN, out SOutput OUT)
{
    OUT.Position = mul(gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION], IN.Position); 
    float4 N = mul(gm_Matrices[MATRIX_WORLD], IN.Normal); 

    OUT.Colour1 = max(0.1,saturate(dot(N.xyz, gm_Lights_Direction[0].xyz))) * gm_Lights_Colour[0].abgr;
    OUT.Colour1.a = 1.0;
    
    OUT.Colour2 = gm_AmbientColour;
    OUT.Colour = IN.Colour;
    OUT.Texcoord = IN.Texcoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// xygthop3's Refraction shader(HLSL9) Fragment
//
struct SInput { //in from vertex to pixel
    float4 Colour    : COLOR0;
    float4 Colour1   : COLOR1;    
    float4 Colour2   : COLOR2;    
    float2 Texcoord : TEXCOORD0;
};

struct SOutput { //out from pixel to screen
    float4 Colour[2]   : COLOR;
};
  
void main(in SInput IN, out SOutput OUT)
{
    float4 Texture = tex2D(gm_BaseTexture, IN.Texcoord.xy);
    OUT.Colour[0] = Texture*IN.Colour1;
    OUT.Colour[1] = IN.Colour;
} 
