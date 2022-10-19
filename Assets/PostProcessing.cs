using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ImageEffectAllowedInSceneView, ExecuteAlways]
public class PostProcessing : MonoBehaviour
{
    public Shader SobelShader;

    private Material mat;
    
    private void OnRenderImage(RenderTexture src, RenderTexture dest)
    {
        if (mat == null)
            mat = new Material(SobelShader);
        
        //Blit does a couple a things it makes a it generates a quad that goes across the entire screen 
        //and it renders that quad using the material you give it. 
        //it also sets the main texture of that material equal to whatever is in the source texture
        //and it renders the result into the destination testure. thats what it does. does that make sense to you? yes!
        Graphics.Blit(src,dest,mat);
        
        
    }
}
