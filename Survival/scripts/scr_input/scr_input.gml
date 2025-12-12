// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_input(){
	
	// --- REINICIO OBLIGATORIO (FIX DEL MOVIMIENTO INFINITO) ---
	// Asumimos que no nos movemos en este frame hasta que se demuestre lo contrario.
	move = 0; 
	dir_mov = -1; 
	
	// Variables temporales para el cambio de arma (Solo Mando)
	var _switch_next = false;
	var _switch_prev = false;

	// =========================================================
	// JUGADOR 1: TECLADO (WASD / Flechas)
	// =========================================================
	if (gamepad_slot == -1) 
	{
		// DERECHA
		if (keyboard_check(vk_right) and !keyboard_check(vk_left))
		{
			move = 1; // ¡Nos movemos!
			if (keyboard_check(vk_up) and !keyboard_check(vk_down))
			{
				dir_mov = 45;
			}
			else
			{
				if (keyboard_check(vk_down) and !keyboard_check(vk_up))
				{
					dir_mov = 315;
				}
				else
				{
					dir_mov = 0;
				}
			}
		}
		
		// IZQUIERDA
		if (keyboard_check(vk_left) and !keyboard_check(vk_right))
		{
			move = 1; // ¡Nos movemos!
			if (keyboard_check(vk_up) and !keyboard_check(vk_down))
			{
				dir_mov = 135;
			}
			else
			{
				if (keyboard_check(vk_down) and !keyboard_check(vk_up))
				{
					dir_mov = 225;
				}
				else
				{
					dir_mov = 180;
				}
			}
		}
		
		// ARRIBA (Sin izq/der)
		if (keyboard_check(vk_up) and !keyboard_check(vk_down))
		{
			// Solo entramos aquí si NO estamos pulsando izq o der 
			// (porque esas ya las cubrimos arriba)
			if (!keyboard_check(vk_right) and !keyboard_check(vk_left))
			{
				move = 1;
				dir_mov = 90;
			}
		}
		
		// ABAJO (Sin izq/der)
		if (keyboard_check(vk_down) and !keyboard_check(vk_up))
		{
			if (!keyboard_check(vk_right) and !keyboard_check(vk_left))
			{
				move = 1;
				dir_mov = 270;
			}
		}
		
		// --- ORIENTACIÓN (TECLADO) ---
		// Si nos estamos moviendo, actualizamos hacia dónde mira el sprite
		if (dir_mov != -1) 
		{
			ori = round(dir_mov / 90) * 90;
			if (ori == 360) ori = 0;
		}

		// --- ACCIONES TECLADO ---
		if (keyboard_check(vk_control)) att = 1; 
		
		// Cambio directo
		if (keyboard_check_pressed(ord("1"))) scr_change_weapon("axe");
		if (keyboard_check_pressed(ord("2"))) scr_change_weapon("fire");
	}
	
	// =========================================================
	// JUGADOR 2: MANDO (PS4 / XBOX)
	// =========================================================
	else 
	{
		// Zona muerta para evitar que se mueva solo si el stick está viejo
		gamepad_set_axis_deadzone(gamepad_slot, 0.2);

		// 1. LEER STICK IZQUIERDO (MOVIMIENTO)
		var _h_axis = gamepad_axis_value(gamepad_slot, gp_axislh);
		var _v_axis = gamepad_axis_value(gamepad_slot, gp_axislv);
		
		// Si el stick se inclina
		if (abs(_h_axis) > 0 || abs(_v_axis) > 0)
		{
			move = 1; // ¡Nos movemos!
			dir_mov = point_direction(0, 0, _h_axis, _v_axis);
		}
		// Nota: Si no mueve el stick, move sigue siendo 0 y dir_mov sigue siendo -1

		// 2. LEER STICK DERECHO (APUNTADO)
		var _h_aim = gamepad_axis_value(gamepad_slot, gp_axisrh);
		var _v_aim = gamepad_axis_value(gamepad_slot, gp_axisrv);

		// Prioridad: Stick Derecho > Stick Izquierdo para la orientación
		if (abs(_h_aim) > 0.2 || abs(_v_aim) > 0.2)
		{
			var _aim_dir = point_direction(0, 0, _h_aim, _v_aim);
			ori = round(_aim_dir / 90) * 90; // Forzamos a 0, 90, 180, 270
			if (ori == 360) ori = 0;
		}
		else if (move) // Si no apunta, mira hacia donde camina
		{
			ori = round(dir_mov / 90) * 90;
			if (ori == 360) ori = 0;
		}

		// 3. ACCIONES MANDO
		// Ataque (Botón X/A)
		if (gamepad_button_check(gamepad_slot, gp_face1)) att = 1;

		// Cambio de Arma (L1 / R1)
		if (gamepad_button_check_pressed(gamepad_slot, gp_shoulderr)) _switch_next = true;
		if (gamepad_button_check_pressed(gamepad_slot, gp_shoulderl)) _switch_prev = true;
		
		if (_switch_next)
		{
			current_weapon_index++;
			if (current_weapon_index >= array_length(weapons_list)) current_weapon_index = 0;
			scr_change_weapon(weapons_list[current_weapon_index]);
		}
		
		if (_switch_prev)
		{
			current_weapon_index--;
			if (current_weapon_index < 0) current_weapon_index = array_length(weapons_list) - 1;
			scr_change_weapon(weapons_list[current_weapon_index]);
		}
	}
}