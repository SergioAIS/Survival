// --- CREATE EVENT de o_control ---

// Buscamos en todos los slots posibles (del 0 al 11)
var _slot_encontrado = -1;

for (var i = 0; i < 12; i++)
{
    if (gamepad_is_connected(i))
    {
        _slot_encontrado = i; // ¡Encontramos el 4!
        break; // Dejamos de buscar
    }
}

// Si encontramos un mando, se lo asignamos al Jugador
if (_slot_encontrado != -1)
{
    // CASO A: ¿Quieres que el mando controle al Jugador 2?
    with (o_player)
    {
        if (player_id == 1) // Solo al que tenga ID 1
        {
            gamepad_slot = _slot_encontrado;
            show_debug_message("Mando Slot " + string(_slot_encontrado) + " asignado al P2");
        }
    }
    
    // CASO B: (Opcional) Si quieres probar con 1 solo jugador usando mando:
    /*
    with (o_player) {
        gamepad_slot = _slot_encontrado;
    }
    */
}