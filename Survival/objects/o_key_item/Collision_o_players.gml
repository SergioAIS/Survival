// 1. Desbloquear la llave globalmente
switch(color_name)
{
    case "red":   global.keys.red = true;   break;
    case "blue":  global.keys.blue = true;  break;
    case "green": global.keys.green = true; break;
}

// 2. Feedback
//audio_play_sound(snd_pickup_key, 10, false);
// instance_create_depth(x, y, -999, o_sparkles); 

// 3. Destruir
instance_destroy();