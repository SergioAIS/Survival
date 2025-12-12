/// @description Interacción (Abrir/Cerrar Menú)

// Alternar estado del menú
menu_active = !menu_active;

if (menu_active)
{
	menu_index = 0; // Reiniciar selección al abrir
	
	// CONGELAR AL JUGADOR
	// Es importante acceder a 'other' con cuidado o usar el objeto directo
	if (instance_exists(player_obj))
	{
		player_obj.move = 0;
		player_obj.speed_mov = 0; // Frenarlo en seco
	}
}
else
{
	// DESCONGELAR AL JUGADOR
	if (instance_exists(player_obj))
	{
		player_obj.move = 1;
	}
}