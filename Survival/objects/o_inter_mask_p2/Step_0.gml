if(active)
{
	// Usamos CÍRCULO (gp_face2) en lugar de Espacio
	if(gamepad_button_check_pressed(gamepad_slot, gp_face2))
	{
		var _obj = instance_place(x,y,o_interactive);
		if(_obj != noone)
		{
			with(_obj)
			{
				event_perform(ev_other,ev_user0);
			}
			active = 0;
			alarm[0] = cooldown;
		}
	}
}