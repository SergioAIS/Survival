// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_att_p2()
{
	var _inst = noone;
	
	// Forzamos una orientación cardinal estricta para el ataque
	// Si ori es 45, lo convertimos a 0 o 90 (el que prefieras, o redondeamos)
	var _att_ori = round(ori / 90) * 90;
	if (_att_ori == 360) _att_ori = 0;

	switch(weapon)
	{
		case "axe":
			image_index = 0;
			_inst = instance_create_depth(x, y, depth, o_axe);
			
			with(_inst)
			{
				dmg = 20;
				// Usamos la nueva variable _att_ori
				switch(_att_ori)
				{
					case 0: break; // Derecha (default del sprite)
					case 90: image_angle = 270; image_xscale = -1; break; // Arriba
					case 180: image_xscale = -1; break; // Izquierda (Espejo)
					case 270: image_angle = 90; image_xscale = -1; break; // Abajo
				}
			}
		break;
		
		case "fire":
			image_index = 0;
			_inst = instance_create_depth(x, y, depth - 10, o_firebolt);
			
			with(_inst)
			{
				dmg = 10;
				image_xscale = 0.85; image_yscale = 0.85;
				
				// Reseteamos velocidades para evitar contaminación de lógica anterior
				hspeed = 0; vspeed = 0;
				
				switch(_att_ori)
				{
					case 0: // Derecha
						hspeed = 7; 
						image_angle = 0;
					break;
					
					case 90: // Arriba
						vspeed = -7; 
						image_angle = 90; 
					break;
					
					case 180: // Izquierda
						hspeed = -7; 
						image_xscale *= -1; // Espejo
						image_angle = 0;
					break;
					
					case 270: // Abajo
						vspeed = 7; 
						image_angle = 270; 
					break;
				}
			}
		break;
	}
}