// --- ASIGNACIÓN DE MANDO (JUGADOR 2) ---

// Buscamos si hay algún mando conectado (Slots 0 a 11)
var _slot_encontrado = -1;

for (var i = 0; i < 12; i++)
{
	if (gamepad_is_connected(i))
	{
		_slot_encontrado = i;
		show_debug_message("Mando encontrado en Slot: " + string(i));
		break; // Nos quedamos con el primero que encontremos
	}
}

// Si encontramos uno y el Player 2 existe, se lo asignamos
if (_slot_encontrado != -1 and instance_exists(o_player2))
{
	o_player2.gamepad_slot = _slot_encontrado;
	
	// También actualizamos su máscara de interacción para que el botón funcione
	if (instance_exists(o_player2.my_mask))
	{
		o_player2.my_mask.gamepad_slot = _slot_encontrado;
	}
}
