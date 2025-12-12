// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_change_weapon(_new_weapon){
	// Guardamos el arma en la variable de ESTA instancia
	weapon = _new_weapon;

	switch (weapon)
	{
		case "axe":
			// Asignamos los sprites a ESTA instancia
			s_att_right = s_axe_right;
			s_att_up    = s_axe_up;
			s_att_down  = s_axe_down;
		break;
		
		case "fire":
			s_att_right = s_use_right;
			s_att_up    = s_use_up;
			s_att_down  = s_use_down;
		break;	
	}
}