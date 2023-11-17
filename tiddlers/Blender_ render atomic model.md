<br><br>

> **Blender version: 3.5.1**
> 
> **ChimeraX version: 1.6.1**

<br>

1. Import the atomic structure in a molecular visualization software, customize the visualizations to your liking. As an example, the visualization for PDB 4KZ2 in ChimeraX is shown below.

	<a href="https://ucarecdn.com/6e0c50b9-9152-462a-b716-c0e570add12b/Blenderchimerax1.png
" target="_blank" rel="noopener noreferrer"><img src="https://ucarecdn.com/6e0c50b9-9152-462a-b716-c0e570add12b/Blenderchimerax1.png
" alt="WESTERLIES" width="300"></a>

2. Save the atomic model to 3D objects in the GL Transmission Format using the command:
	```bash
	save 4kz2.glb
	```

3. Import the **glb** file into Blender using ***File → Import → glTF 2.0***. Show the color from ChimeraX in the **Material Preview** mode. The imported object **4kz2** should contain mesh components including **ribbons**, **bonds**, and **atoms**.

	<a href="https://ucarecdn.com/33ad52b4-c9e1-48ee-9119-a8a7622eab52/Blenderchimerax2.png
" target="_blank" rel="noopener noreferrer"><img src="https://ucarecdn.com/33ad52b4-c9e1-48ee-9119-a8a7622eab52/Blenderchimerax2.png
" alt="WESTERLIES" width="500"></a>

4. Select **ribbons**, **bonds**, and **atoms**, increase their **Metallic** and reduce their **Roughness** in **Material Properties**.

5. Adjust the **Camera**, **Light**, and the imported object according to the preferred viewing specifications, ensuring that your desired model is visible in **Camera**. Check the rendering effect in the **Rendered** mode. You can set the camera to the current view using ***View → Align View → Align Active Camera To View***.

6. Select the **Cycles** render engine in **Render Properties**. Render the model to obtain the final product.

	<a href="https://ucarecdn.com/cf2d9dd0-56bf-406e-b43c-82e1da9807b5/Blenderchimerax3.png
" target="_blank" rel="noopener noreferrer"><img src="https://ucarecdn.com/cf2d9dd0-56bf-406e-b43c-82e1da9807b5/Blenderchimerax3.png
" alt="WESTERLIES" width="500"></a>