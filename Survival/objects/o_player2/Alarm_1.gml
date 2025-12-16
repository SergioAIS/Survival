/// @description Respawn 

if (instance_exists(o_respawn))
{
    // 1. TELETRANSPORTE
    x = o_respawn.x + 32; // Aparece a la DERECHA de la fogata <--- CAMBIO
    y = o_respawn.y;

    // 2. RESET STATS
    hp = hp_max;
    invi = 120;
    move = 1;
    dead = 0;
    visible = 1;
    
    sprite_index = s_stand_down;
    image_alpha = 1;
}
else
{
    room_restart();
}