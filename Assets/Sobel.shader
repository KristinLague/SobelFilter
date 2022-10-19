Shader "Hidden/Sobel"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        // No culling or depth
        Cull Off ZWrite Off ZTest Always

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            sampler2D _MainTex;
            float4 _MainTex_TexelSize; // x = 1/width, y = 1/height, z = width, w = height

            float4 frag (v2f i) : SV_Target
            {
                float3 left = tex2D(_MainTex,float2(i.uv.x - _MainTex_TexelSize.x,i.uv.y));
                float3 right = tex2D(_MainTex, float2(i.uv.x + _MainTex_TexelSize.x,i.uv.y));
                float3 top = tex2D(_MainTex, float2(i.uv.x,i.uv.y + _MainTex_TexelSize.y));
                float3 topLeft = tex2D(_MainTex, float2(i.uv.x - _MainTex_TexelSize.x,i.uv.y + _MainTex_TexelSize.y));
                float3 topRight = tex2D(_MainTex, float2(i.uv.x + _MainTex_TexelSize.x,i.uv.y + _MainTex_TexelSize.y));
                float3 bottom = tex2D(_MainTex, float2(i.uv.x, i.uv.y - _MainTex_TexelSize.y));
                float3 bottomLeft = tex2D(_MainTex, float2(i.uv.x - _MainTex_TexelSize.x,i.uv.y - _MainTex_TexelSize.y));
                float3 bottomRight = tex2D(_MainTex, float2(i.uv.x + _MainTex_TexelSize.x,i.uv.y - _MainTex_TexelSize.y));

                float3 colH = 2 * (right - left) + topRight - topLeft + bottomRight - bottomLeft;
                float3 colV = 2 * (top - bottom) + topRight - bottomRight + topLeft - bottomLeft;
                
                float col = sqrt(dot(colH, colH) + dot(colV, colV));
                return col;
            }
            ENDCG
        }
    }
}
