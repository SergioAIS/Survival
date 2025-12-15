// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_input_p2()
{
	gamepad_set_axis_deadzone(gamepad_slot, 0.2);
	
	var _h = gamepad_axis_value(gamepad_slot, gp_axislh);
	var _v = gamepad_axis_value(gamepad_slot, gp_axislv);
	
	if (abs(_h) > 0 or abs(_v) > 0)
	{
		// Obtenemos dirección exacta (0-360)
		var _pdir = point_direction(0, 0, _h, _v);
		
		// Opcional: Redondear a incrementos de 45 grados para que se sienta como "8 direcciones"
		// Si prefieres movimiento libre 360°, quita la línea de round.
		// Pero para tus sprites, 45 grados es mejor.
		dir_mov = round(_pdir / 45) * 45;
		
		if (dir_mov == 360) dir_mov = 0;
	}
	
	// CAMBIO DE ARMA
	if (gamepad_button_check_pressed(gamepad_slot, gp_padu))
	{
		if (pick_axe) scr_change_weapon_p2("axe");
	}
	if (gamepad_button_check_pressed(gamepad_slot, gp_padl))
	{
		if (pick_fire) scr_change_weapon_p2("fire");
	}
	
	if (gamepad_button_check_pressed(gamepad_slot, gp_padd))
	{
		if (pick_fire) scr_change_weapon_p2("ice");
	}
}