/// @description Respawn 

// Verificamos si hay una fogata activa en esta sala
if (instance_exists(o_respawn))
{
    // 1. TELETRANSPORTE (Sin recargar la room)
    x = o_respawn.x - 32; // Aparece a la IZQUIERDA de la fogata
    y = o_respawn.y;

    // 2. RESET STATS
    hp = hp_max;
    invi = 120;   // Damos 2 seg de invencibilidad para que no lo maten al nacer
    move = 1;
    dead = 0;
    visible = 1;
    
    // Resetear animaciones
    sprite_index = s_stand_down; 
    image_alpha = 1;
    
    // Efecto visual opcional
    // effect_create_below(ef_ring, x, y, 1, c_white);
}
else
{
    // Si mueren en una zona SIN respawn (ej: caída al vacío en dungeon),
    // aquí sí reiniciamos la sala completa como castigo.
    room_restart();
}