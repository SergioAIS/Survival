/// @description Interacción (Abrir/Cerrar)

// Si el cooldown está activo, ignoramos la interacción
if (menu_cooldown > 0) exit;

menu_active = !menu_active;

if (menu_active)
{
	menu_index = 0;
	menu_cooldown = 15; // Damos 15 frames de "seguridad" para no cerrarlo por error
	
	// Congelar jugadores (Opcional, congela a ambos)
	with(o_player) { move = 0; speed_mov = 0; }
	with(o_player2) { move = 0; speed_mov = 0; }
}
else
{
	// Descongelar
	with(o_player) move = 1;
	with(o_player2) move = 1;
	
	menu_cooldown = 15;
}