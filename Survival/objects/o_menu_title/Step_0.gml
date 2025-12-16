// --- INPUTS (Horizontal) ---
var _left = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
var _right = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
var _select = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);

// --- MOVIMIENTO ---
// Ahora: Derecha suma (1), Izquierda resta (-1)
var _move = _right - _left; 

if (_move != 0)
{
    menu_index += _move;
    
    // Lógica de "Wrap" (Rotación infinita)
    var _size = array_length(options);
    
    if (menu_index < 0) menu_index = _size - 1;
    else if (menu_index >= _size) menu_index = 0;
    
    // Sonido de movimiento (comentado)
    audio_play_sound(snd_confirm, 1, false);
}

// --- ACCIÓN (ENTER) ---
if (_select)
{
    // Sonido de selección (comentado)
    audio_play_sound(snd_confirm, 1, false);

    switch(menu_index)
    {
        case 0: // JUGAR
             room_goto(Room1); // Cambia esto por tu room de juego real
        break;
        
        case 1: // TUTORIAL
			 io_clear()
			 room_goto(r_tutorial)
             show_debug_message("Ir a Tutorial");
        break;
        
        case 2: // SALIR
            game_end();
        break;
    }
}