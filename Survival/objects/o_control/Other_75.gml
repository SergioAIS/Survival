switch(async_load[? "event_type"])             
{
    case "gamepad discovered":                     
        var _pad = async_load[? "pad_index"];       
        
        // Asignar al Jugador 2 si no tiene mando
        if (instance_exists(o_player))
        {
            with (o_player)
            {
                // Buscamos al jugador 2 (id 1) y le damos el mando
                if (player_id == 1 and gamepad_slot == -1) {
                    gamepad_slot = _pad;
                    show_debug_message("Mando conectado al Player 2");
                }
            }
        }
        break;

    case "gamepad lost":                           
        var _pad = async_load[? "pad_index"];       
        // Lógica de pausa si se desconecta el mando
        break;
}