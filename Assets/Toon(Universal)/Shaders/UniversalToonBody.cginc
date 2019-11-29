//UCTS_DoubleShadeWithFeather.cginc
//Unitychan Toon Shader ver.2.0
//v.2.0.7.5
//nobuyuki@unity3d.com
//toshiyuki@unity3d.com (LWRP)  
//https://github.com/unity3d-jp/UnityChanToonShaderVer2_Project
//(C)Unity Technologies Japan/UCL
//#pragma multi_compile _IS_CLIPPING_OFF _IS_CLIPPING_MODE  _IS_CLIPPING_TRANSMODE
//#pragma multi_compile _IS_PASS_FWDBASE _IS_PASS_FWDDELTA
//


            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _1st_ShadeMap; uniform float4 _1st_ShadeMap_ST;
            uniform sampler2D _2nd_ShadeMap; uniform float4 _2nd_ShadeMap_ST;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform sampler2D _Set_1st_ShadePosition; uniform float4 _Set_1st_ShadePosition_ST;
            uniform sampler2D _Set_2nd_ShadePosition; uniform float4 _Set_2nd_ShadePosition_ST;
            uniform sampler2D _HighColor_Tex; uniform float4 _HighColor_Tex_ST;
            uniform sampler2D _Set_HighColorMask; uniform float4 _Set_HighColorMask_ST;
            uniform sampler2D _Set_RimLightMask; uniform float4 _Set_RimLightMask_ST;
            uniform sampler2D _MatCap_Sampler; uniform float4 _MatCap_Sampler_ST;
            uniform sampler2D _NormalMapForMatCap; uniform float4 _NormalMapForMatCap_ST;
            uniform sampler2D _Set_MatcapMask; uniform float4 _Set_MatcapMask_ST;
            uniform sampler2D _Emissive_Tex; uniform float4 _Emissive_Tex_ST;
            uniform sampler2D _ClippingMask; uniform float4 _ClippingMask_ST;


            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
            };
 
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }

            float4 frag(VertexOutput i, fixed facing : VFACE) : SV_TARGET
            {
                const float2 zero_uv = float2(0.5,0.5);


                const float3 _NormalMap_var = tex2D(_NormalMap, zero_uv);
                const float4 _MainTex_var = tex2D(_MainTex,zero_uv);
                const float4 _1st_ShadeMap_var = tex2D(_1st_ShadeMap,zero_uv); 
                const float4 _2nd_ShadeMap_var = tex2D(_2nd_ShadeMap,zero_uv);
                const float4 _Set_2nd_ShadePosition_var = tex2D(_Set_2nd_ShadePosition,zero_uv);
                const float4 _Set_1st_ShadePosition_var = tex2D(_Set_1st_ShadePosition,zero_uv);
                const float4 _Set_HighColorMask_var = tex2D(_Set_HighColorMask,zero_uv);
                const float3 _NormalMapForMatCap_var = tex2D(_NormalMapForMatCap, zero_uv);
                const float4 _MatCap_Sampler_var = tex2D(_MatCap_Sampler,zero_uv);
                const float4 _Set_MatcapMask_var = tex2D(_Set_MatcapMask,zero_uv);
                const float4 _Emissive_Tex_var = tex2D(_Emissive_Tex,zero_uv);
                const float4 _ClippingMask_var = tex2D(_ClippingMask,zero_uv);
                const float4 albedo = SAMPLE_TEXTURE2D(_BaseMap, sampler_BaseMap, zero_uv);//tex2D(sampler_BaseMap, zero_uv);
				const float attenuation = SAMPLE_TEXTURE2D_SHADOW(_MainLightShadowmapTexture, sampler_MainLightShadowmapTexture, float3(zero_uv,1)).r;
                const float4 _Set_RimLightMask_var = tex2D(_Set_RimLightMask,zero_uv);
                const float4 _HighColor_Tex_var = tex2D(_HighColor_Tex,zero_uv);



                float3 finalColor = _NormalMap_var.rgb 
                    + _MainTex_var.rgb                     
                    + _1st_ShadeMap_var
                    + _2nd_ShadeMap_var.rgb
                    + _Set_2nd_ShadePosition_var.rgb
                    + _Set_1st_ShadePosition_var.rgb
                    + _Set_HighColorMask_var.rgb
                    + _NormalMapForMatCap_var.rgb
                    + _MatCap_Sampler_var.rgb
                    + _Set_MatcapMask_var.rgb
                    + _Emissive_Tex_var.rgb
                    + _ClippingMask_var.rgb
                    + albedo.rgb
                    + float3(attenuation, attenuation, attenuation)
                    + _Set_RimLightMask_var.rgb
                    + _HighColor_Tex_var.rgb                    
                ;

                return float4(finalColor.rgb,1);                      
            }
