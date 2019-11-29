//Unitychan Toon Shader ver.2.0
//v.2.0.7.5
//nobuyuki@unity3d.com
//toshiyuki@unity3d.com (LWRP) 
//https://github.com/unity3d-jp/UnityChanToonShaderVer2_Project
//(C)Unity Technologies Japan/UCL
Shader "Universal Render Pipeline/Toon" {
    Properties {

        _ClippingMask("ClippingMask", 2D) = "white" {}
        _MainTex ("BaseMap", 2D) = "white" {}
        [HideInInspector] _BaseMap ("BaseMap", 2D) = "white" {}
        _BaseColor ("BaseColor", Color) = (1,1,1,1)

        [HideInInspector] _Color ("Color", Color) = (1,1,1,1)
        _1st_ShadeMap ("1st_ShadeMap", 2D) = "white" {}
        _NormalMap ("NormalMap", 2D) = "bump" {}

        _Set_1st_ShadePosition ("Set_1st_ShadePosition", 2D) = "white" {}
        _Set_2nd_ShadePosition ("Set_2nd_ShadePosition", 2D) = "white" {}
        _ShadingGradeMap("ShadingGradeMap", 2D) = "white" {}
        _HighColor ("HighColor", Color) = (0,0,0,1)
        _HighColor_Tex ("HighColor_Tex", 2D) = "white" {}
        _Set_HighColorMask ("Set_HighColorMask", 2D) = "white" {}
        _Set_RimLightMask ("Set_RimLightMask", 2D) = "white" {}
        _MatCap_Sampler ("MatCap_Sampler", 2D) = "black" {}
        _NormalMapForMatCap ("NormalMapForMatCap", 2D) = "bump" {}
        _Set_MatcapMask ("Set_MatcapMask", 2D) = "white" {}
        _AngelRing_Sampler("AngelRing_Sampler", 2D) = "black" {}
        _Emissive_Tex ("Emissive_Tex", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
//ToonCoreStart
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="LightweightForward"
            }


            HLSLPROGRAM
            #pragma target 5.0

    	    #pragma vertex vert
            #pragma fragment frag

	        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
	        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
	        #include "Packages/com.unity.render-pipelines.universal/Shaders/LitInput.hlsl"
	        #include "Packages/com.unity.render-pipelines.universal/Shaders/LitForwardPass.hlsl"
	        #include "UniversalToonHead.cginc"
	        #include "UniversalToonBody.cginc"

            ENDHLSL
            
        }

//ToonCoreEnd
    }
    CustomEditor "UnityChan.UniversalToonGUI"
}
