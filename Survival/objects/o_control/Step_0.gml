// --- SISTEMA DE PAUSA ---

// 1. Detectar Inputs
var _pause_keyboard = keyboard_check_pressed(vk_escape);
var _pause_gamepad = false;

// Revisamos el mando del Player 2 (si tiene uno asignado)
if (instance_exists(o_player2))
{
	var _slot = o_player2.gamepad_slot;
	if (gamepad_is_connected(_slot))
	{
		// Botón OPTIONS (PS4) o START (Xbox)
		if (gamepad_button_check_pressed(_slot, gp_start)) _pause_gamepad = true;
	}
}

// 2. Activar Pausa
// Solo si se aprieta el botón Y no está pausado ya (no existe o_pause)
if ((_pause_keyboard || _pause_gamepad) && !instance_exists(o_pause))
{
	// Creamos el objeto de pausa en una profundidad muy alta (encima de todo)
	// Asegúrate de que las coordenadas 0,0 estén dentro de la vista o usa la cámara
	var _cam_x = camera_get_view_x(view_camera[0]);
	var _cam_y = camera_get_view_y(view_camera[0]);
	
	instance_create_depth(_cam_x, _cam_y, -9999, o_pause);
}