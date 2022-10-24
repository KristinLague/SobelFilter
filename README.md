# PostProcessing Image Effect SobelFilter

An ImageEffect Shader using the SobelFilter rendering the scene in black and white only showing edges.

![Alt Text](https://raw.githubusercontent.com/KristinLague/KristinLague.github.io/main/Images/EdgeChess.gif)
![Alt Text](https://github.com/KristinLague/KristinLague.github.io/blob/main/Images/Screenshot%202022-10-19%20at%2017.03.02.png)

## How does it work? 
I am working in a Kernel over every Pixel in a Texture. I calculate the weighted, average color both in horizontal and vertical direction for the Kernel and then convolve the results of this operation. 

![Alt Text](https://raw.githubusercontent.com/KristinLague/KristinLague.github.io/main/Images/VisualizationSobelFilter.gif)

## Applications:
Mostly fun shaders but this operation is also used for Seam Carving!
