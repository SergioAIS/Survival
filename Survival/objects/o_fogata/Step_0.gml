// Reducir cooldown de seguridad
if (menu_cooldown > 0) menu_cooldown--;

// --- LÓGICA DEL MENÚ ---
if (menu_active)
{
    // =========================================================
    // 1. NAVEGACIÓN (Se mantiene igual, compartido)
    // =========================================================
    var _move_up = false;
    var _move_down = false;
    
    // A) Teclado (P1)
    if (keyboard_check_pressed(vk_up)) _move_up = true;
    if (keyboard_check_pressed(vk_down)) _move_down = true;
    
    // B) Gamepad (P2)
    if (gamepad_button_check_pressed(gamepad_slot, gp_padu)) _move_up = true;
    if (gamepad_button_check_pressed(gamepad_slot, gp_padd)) _move_down = true;
    
    var _v_axis = gamepad_axis_value(gamepad_slot, gp_axislv);
    if (abs(_v_axis) > 0.5) {
        if (!stick_pushed) {
            if (_v_axis > 0) _move_down = true; else _move_up = true;
            stick_pushed = true;
        }
    } else {
        stick_pushed = false;
    }

    if (_move_down) {
        menu_index++;
        if (menu_index >= array_length(menu_options)) menu_index = 0;
    }
    if (_move_up) {
        menu_index--;
        if (menu_index < 0) menu_index = array_length(menu_options) - 1;
    }

    // =========================================================
    // 2. SELECCIÓN (DIFERENCIADA)
    // =========================================================
    
    // Detectamos quién presionó por separado
    var _select_p1 = (keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space));
    var _select_p2 = gamepad_button_check_pressed(gamepad_slot, gp_face1);

    // Si ALGUIEN seleccionó y no hay cooldown
    if ((_select_p1 or _select_p2) and menu_cooldown == 0)
    {
        var _costo = menu_options[menu_index][1];
        
        // Verificamos dinero global
        if (global.money >= _costo)
        {
            switch(menu_index)
            {
                case 0: // Curar (Afecta a ambos)
                    if (o_player.hp < o_player.hp_max || o_player2.hp < o_player2.hp_max) {
                        global.money -= _costo;
                        o_player.hp = o_player.hp_max;
                        o_player2.hp = o_player2.hp_max;
						audio_play_sound(snd_curacion,1,0)
                    }
                break;
                
                case 1: // Reparar Fogata
                    if (hp < hp_max) {
                        global.money -= _costo;
                        hp = hp_max;
						audio_play_sound(snd_buy_sell,1,0)
                    }
                break;
                
                case 2: // MEJORAR DAÑO (COSTO PROGRESIVO)
					
					// Variable para saber si la transacción fue exitosa
					var _comprado = false;

					// --- LÓGICA DE COMPRA ---
					// Si fue P1 (Teclado)
					if (_select_p1)
					{
						 global.money -= _costo;
						 o_player.axe_dmg += 5; // Mejora daño P1
						 _comprado = true;
					}
					// Si fue P2 (Mando)
					else if (_select_p2)
					{
						 global.money -= _costo;
						 o_player2.axe_dmg += 5; // Mejora daño P2 (o_axeG)
						 _comprado = true;
					}

					// --- ACTUALIZAR PRECIO (SI SE COMPRÓ) ---
					if (_comprado)
					{
						// 1. Calcular nuevo precio (multiplicamos por 1.5 y redondeamos hacia arriba)
						var _nuevo_precio = ceil(_costo * 1.5);
						
						// 2. Guardar el nuevo precio numérico en el array
						menu_options[2][1] = _nuevo_precio;

						// 3. ¡IMPORTANTE! Actualizar el TEXTO visible del menú
						// Si no haces esto, el jugador seguirá viendo el precio viejo
						menu_options[2][0] = "Mejorar Daño ($" + string(_nuevo_precio) + ")";
					}
					audio_play_sound(snd_level_up1,1,0)
				break;
                
                case 3: // Cerrar
                    event_user(0);
                break;
            }
        }
    }
    
    // =========================================================
    // 3. CANCELAR / CERRAR
    // =========================================================
    if (gamepad_button_check_pressed(gamepad_slot, gp_face2) and menu_cooldown == 0)
    {
        event_user(0);
    }
    
    // Safety check distancia
    if (instance_exists(o_player) and instance_exists(o_player2))
    {
        if (distance_to_object(o_player) > 100 and distance_to_object(o_player2) > 100)
        {
            menu_active = false;
            with(o_player) move = 1;
            with(o_player2) move = 1;
        }
    }
}

if (hp <= 0) instance_destroy();