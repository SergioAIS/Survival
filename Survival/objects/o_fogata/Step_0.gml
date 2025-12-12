// --- LÓGICA DEL MENÚ ---
if (menu_active)
{
	// 1. Navegación
	if (keyboard_check_pressed(vk_down)) {
		menu_index++;
		if (menu_index >= array_length(menu_options)) menu_index = 0;
	}
	
	if (keyboard_check_pressed(vk_up)) {
		menu_index--;
		if (menu_index < 0) menu_index = array_length(menu_options) - 1;
	}

	// 2. Selección 
	// Usamos ENTER para seleccionar. 
	// NOTA: Si usas ESPACIO aquí, asegúrate de que el cooldown de tu o_inter_mask sea suficiente
	// para que no se cierre el menú inmediatamente al elegir una opción.
	if (keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space))
	{
		var _costo = menu_options[menu_index][1];
		
		// Verificar Dinero
		if (global.money >= _costo)
		{
			switch(menu_index)
			{
				case 0: // Curar
					if (instance_exists(player_obj) and player_obj.hp < o_player.hp_max) { // Asumiendo 100 como max vida
						global.money -= _costo;
						player_obj.hp += 50; // O la variable de vida máxima que tengas
						// Sonido: audio_play_sound(snd_heal, 1, false);
					}
				break;
				
				case 1: // Reparar Fogata
					if (hp < hp_max) {
						global.money -= _costo;
						hp = hp_max;
					}
				break;
				
				case 2: // Mejora (Ejemplo)
					global.money -= _costo;
					// Lógica de mejora...
					// Aumentar precio dinámicamente:
					menu_options[2][1] += 100;
					menu_options[2][0] = "Mejorar Daño ($" + string(menu_options[2][1]) + ")";
				break;
				
				case 3: // Cerrar
					event_user(0); // Llamamos al evento 0 manualmente para cerrar
					exit; // Salimos del evento para evitar conflictos
				break;
			}
		}
	}
	
	// 3. Cerrar por distancia (Safety check)
	if (instance_exists(player_obj))
	{
		if (distance_to_object(player_obj) > 80) // Un poco más de rango
		{
			menu_active = false;
			player_obj.move = 1;
		}
	}
}

// --- CHEQUEO DE DESTRUCCIÓN ---
if (hp <= 0)
{
	// Lógica de Game Over
	instance_destroy();
}