// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_att(){
	
	var _inst = noone;
	
	switch(weapon)
	{
		case "axe":
			image_index = 0;
			_inst = instance_create_depth(x, y, depth, o_axe);
			audio_play_sound(snd_axe_1, 1, 0)
			// AHORA el script configura el hacha (porque el Create del hacha está vacío)
			with(_inst)
			{
				dmg = other.axe_dmg;
				// Usamos other.ori (la orientación del Player 1)
				switch(other.ori)
				{
					case 0: 
						// Derecha: Valores por defecto
						image_angle = 0; 
						image_xscale = 1;
					break;
					
					case 90: // Arriba
						image_angle = 270; 
						image_xscale = -1; 
					break;
					
					case 180: // Izquierda
						image_angle = 0;
						image_xscale = -1; 
					break;
					
					case 270: // Abajo
						image_angle = 90; 
						image_xscale = -1; 
					break;
				}
			}
		break;
		
		case "fire":
			image_index = 0;
			_inst = instance_create_depth(x, y, depth - 10, o_firebolt);
			audio_play_sound(snd_fireball,1,0)
			with(_inst)
			{
				image_xscale = 0.85; 
				image_yscale = 0.85;
				
				switch(other.ori)
				{
					case 0: hspeed = 7; break;
					
					case 90: 
						image_angle = 90; 
						vspeed = -7; 
					break;
					
					case 180: 
						hspeed = -7; 
						image_xscale = -0.85; // Invertimos la escala original
					break;
					
					case 270: 
						image_angle = 270; 
						vspeed = 7; 
					break;
				}
			}
		break;
		
		case "ice":
			image_index = 0;
			_inst = instance_create_depth(x, y, depth - 10, o_icebolt);
			audio_play_sound(snd_iceball,1,0)
			with(_inst)
			{
				image_xscale = 0.85; 
				image_yscale = 0.85;
				
				switch(other.ori)
				{
					case 0: hspeed = 7; break;
					
					case 90: 
						image_angle = 90; 
						vspeed = -7; 
					break;
					
					case 180: 
						hspeed = -7; 
						image_xscale = -0.85; // Invertimos la escala original
					break;
					
					case 270: 
						image_angle = 270; 
						vspeed = 7; 
					break;
				}
			}
		break;
	}
}