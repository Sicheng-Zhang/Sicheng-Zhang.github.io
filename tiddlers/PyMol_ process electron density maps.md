<br><br>

1. Load the electron density map (as `em-map`) and the reference structure (as `struc`).

2. Increase the sampling rate of the map:

	```
	as cartoon, struc
	as dots, em-map
	map_double em-map, -1
	```
	
3. Trim the map to 7 Å around the structure:
	```
	map_trim em-map, struc, 7
	```

4. Create dot map (`dot-map`), mesh map (`mesh-map`), or surface map (`surface-map`) from the `em-map`, contoured at 2.0 sigma, surrounding `struc`, within a radius of 3 Å.
	```
	isodot dot-map, em-map, 2.0, struc, carve=3.0
	isomesh mesh-map, em-map, 2.0, struc, carve=3.0
	isosurface surface-map, em-map, 2.0, struc, carve=3.0
	```
	
	Result:
	
	<a href="https://ucarecdn.com/d4ad23e3-9bde-480d-ad5b-811a045689e6/pymol-em-map.png
" target="_blank" rel="noopener noreferrer" class="center"><img src="https://ucarecdn.com/d4ad23e3-9bde-480d-ad5b-811a045689e6/pymol-em-map.png
" alt="WESTERLIES" width="350"></a>
