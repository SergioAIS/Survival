// --- FORZAR NOCHE AL VOLVER DE DUNGEON ---
if (global.force_night_return == true)
{
	time = 0.75; // 18:00 PM (Inicio del atardecer/noche)
	global.force_night_return = false; // Apagar bandera
	
	// Actualizar lógica inmediata
	global.is_day = false;
	current_alpha = 0.25; // Un poco oscuro para empezar suave
	current_color = color_sunset;
}