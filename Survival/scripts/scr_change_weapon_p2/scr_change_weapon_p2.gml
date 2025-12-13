// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_change_weapon_p2(_new_weapon)
{
	// Actualizamos la variable de arma
	weapon = _new_weapon;

	switch(_new_weapon)
	{
		case "axe":
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