// Evento: Asynchronous > System
switch(async_load[? "event_type"])             
{
	case "gamepad discovered":
		var _pad = async_load[? "pad_index"];
		// Asignar al P2 dinámicamente
		if (instance_exists(o_player2))
		{
			o_player2.gamepad_slot = _pad;
			if (instance_exists(o_player2.my_mask)) o_player2.my_mask.gamepad_slot = _pad;
			show_debug_message("Mando conectado y asignado al P2");
		}
	break;
}