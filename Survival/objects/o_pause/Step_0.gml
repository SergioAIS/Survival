if (menu_cooldown > 0) menu_cooldown--;

// --- INPUTS ---
var _up = false;
var _down = false;
var _select = false;


// 1. Teclado
if (keyboard_check_pressed(vk_up)) _up = true;
if (keyboard_check_pressed(vk_down)) _down = true;
if (keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space)) _select = true;

// 2. Gamepad
if (gamepad_is_connected(gamepad_slot))
{
	// Flechas
	if (gamepad_button_check_pressed(gamepad_slot, gp_padu)) _up = true;
	if (gamepad_button_check_pressed(gamepad_slot, gp_padd)) _down = true;
	// Botón X (Aceptar)
	if (gamepad_button_check_pressed(gamepad_slot, gp_face1)) _select = true;
	
	// Joystick (con freno)
	var _v_axis = gamepad_axis_value(gamepad_slot, gp_axislv);
	if (abs(_v_axis) > 0.5) {
		if (!stick_pushed) {
			if (_v_axis > 0) _down = true; else _up = true;
			stick_pushed = true;
		}
	} else {
		stick_pushed = false;
	}
}

// --- LÓGICA ---

// Mover cursor
if (_down) {
	menu_index++;
	if (menu_index >= array_length(menu_options)) menu_index = 0;
}
if (_up) {
	menu_index--;
	if (menu_index < 0) menu_index = array_length(menu_options) - 1;
}

// Seleccionar
if (_select and menu_cooldown == 0)
{
	switch(menu_index)
	{
		case 0: // CONTINUAR
			instance_destroy(); // Al destruirse, reactiva todo (ver evento Destroy)
			audio_play_sound(snd_unpause,1,0)
		break;
		
		case 1: // SALIR
			game_end(); // O room_goto(r_menu_principal);
		break;
	}
}