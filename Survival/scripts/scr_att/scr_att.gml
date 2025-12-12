// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_att(){
	
	// Reiniciamos la animación del golpe
	image_index = 0;

	var _inst; // Variable temporal para guardar el objeto creado

	switch (weapon)
	{
		case "axe":
			_inst = instance_create_depth(x, y, depth, o_axe);
		break;
		
		case "fire":
			_inst = instance_create_depth(x, y, depth - 10, o_firebolt);
			_inst.speed = 8; // Aseguramos velocidad
		break;
	}
	
	// --- FIX OBLIGATORIO PARA 2 JUGADORES ---
	// Como ahora hay 2 players, le decimos al objeto: "Toma MI dirección, no la del otro"
	if (instance_exists(_inst))
	{
		_inst.owner = id;      // "Yo te creé"
		_inst.direction = ori; // "Ve hacia allá"
		_inst.image_angle = ori;
		
		// CORRECCIÓN VISUAL: Si miras a la izquierda (180), usamos espejo en vez de rotación
		// para que el dibujo no quede "patas arriba".
		if (ori == 180) {
			_inst.image_angle = 0;
			_inst.image_xscale = -1;
		} else {
			_inst.image_xscale = 1;
		}
	}
}