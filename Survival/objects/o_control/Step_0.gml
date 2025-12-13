// Step Event de o_control

// Detectar tecla ESCAPE o botón START (gp_start)
var _pause_key = keyboard_check_pressed(vk_escape);
var _pause_pad = false;

// Revisamos el mando (usamos slot 4 como en tus otros códigos, o 0)
if (gamepad_is_connected(4)) {
	if (gamepad_button_check_pressed(4, gp_start)) _pause_pad = true;
} else if (gamepad_is_connected(0)) {
	if (gamepad_button_check_pressed(0, gp_start)) _pause_pad = true;
}

// Si no existe ya el menú de pausa, lo creamos
if ((_pause_key or _pause_pad) and !instance_exists(o_pause))
{
	instance_create_depth(0, 0, -9999, o_pause);
}