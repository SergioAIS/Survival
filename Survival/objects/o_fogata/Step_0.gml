// Reducir cooldown de seguridad
if (menu_cooldown > 0) menu_cooldown--;

// --- LÓGICA DEL MENÚ ---
if (menu_active)
{
	// =========================================================
	// 1. NAVEGACIÓN (Arriba / Abajo)
	// =========================================================
	var _move_up = false;
	var _move_down = false;
	
	// A) Teclado (P1)
	if (keyboard_check_pressed(vk_up)) _move_up = true;
	if (keyboard_check_pressed(vk_down)) _move_down = true;
	
	// B) Gamepad (P2) - Flechas (D-Pad)
	if (gamepad_button_check_pressed(gamepad_slot, gp_padu)) _move_up = true;
	if (gamepad_button_check_pressed(gamepad_slot, gp_padd)) _move_down = true;
	
	// C) Gamepad (P2) - Joystick Analógico (Con lógica de "Pressed")
	var _v_axis = gamepad_axis_value(gamepad_slot, gp_axislv);
	
	if (abs(_v_axis) > 0.5) // Si mueve el stick
	{
		if (!stick_pushed) // Y no estaba movido antes
		{
			if (_v_axis > 0) _move_down = true;
			else _move_up = true;
			
			stick_pushed = true; // Bloqueamos hasta que suelte
		}
	}
	else
	{
		stick_pushed = false; // Soltó el stick, reseteamos
	}

	// --- APLICAR MOVIMIENTO ---
	if (_move_down) {
		menu_index++;
		if (menu_index >= array_length(menu_options)) menu_index = 0;
		// Sonido opcional: audio_play_sound(snd_bip, 1, false);
	}
	
	if (_move_up) {
		menu_index--;
		if (menu_index < 0) menu_index = array_length(menu_options) - 1;
		// Sonido opcional: audio_play_sound(snd_bip, 1, false);
	}

	// =========================================================
	// 2. SELECCIÓN (Aceptar)
	// =========================================================
	var _select = false;
	
	// Teclado: Enter o Espacio
	if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) _select = true;
	
	// Mando: Botón X (gp_face1)
	if (gamepad_button_check_pressed(gamepad_slot, gp_face1)) _select = true;

	if (_select && menu_cooldown == 0)
	{
		var _costo = menu_options[menu_index][1];
		
		// Verificamos dinero (asumiendo global.money)
		if (global.money >= _costo)
		{
			switch(menu_index)
			{
				case 0: // Curar (Afecta a ambos por ahora o al que interactuó)
					if (o_player.hp < o_player.hp_max || o_player2.hp < o_player2.hp_max) {
						global.money -= _costo;
						o_player.hp = o_player.hp_max;
						o_player2.hp = o_player2.hp_max;
					}
				break;
				
				case 1: // Reparar Fogata
					if (hp < hp_max) {
						global.money -= _costo;
						hp = hp_max;
					}
				break;
				
				case 2: // Mejorar
					global.money -= _costo;
					// Lógica de mejora...
					menu_options[2][1] = ceil(menu_options[2][1] * 1.5);
				break;
				
				case 3: // Cerrar
					event_user(0); // Llamamos al evento de cerrar
				break;
			}
		}
	}
	
	// =========================================================
	// 3. CANCELAR / CERRAR (Círculo)
	// =========================================================
	// Si aprieta Círculo (gp_face2), cerramos el menú
	if (gamepad_button_check_pressed(gamepad_slot, gp_face2) and menu_cooldown == 0)
	{
		event_user(0);
	}
	
	// Cerrar por distancia (Safety check)
	if (instance_exists(o_player))
	{
		if (distance_to_object(o_player) > 100 and distance_to_object(o_player2) > 100)
		{
			menu_active = false;
			with(o_player) move = 1;
			with(o_player2) move = 1;
		}
	}
}

// --- CHEQUEO DE DESTRUCCIÓN ---
if (hp <= 0)
{
	instance_destroy();
}