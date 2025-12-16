/// @description si

// Accedemos directamente a la propiedad .red del struct global.keys
if (global.keys.red == true)
{
	image_speed = 2;
	
	with (target)
	{
		event_perform(ev_other, ev_user0);
	}
}
else
{
	// Opcional: Feedback si no tiene la llave (sonido de error o texto)
	show_debug_message("Necesitas la llave roja");
}