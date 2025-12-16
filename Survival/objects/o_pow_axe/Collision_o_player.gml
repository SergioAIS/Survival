scr_change_weapon("axe")
o_player.pick_axe = 1;
	obj = instance_create_layer(x, y, "GUI", o_float_text)
	obj.type = "att"
	obj.value = "You got an Axe!"
scr_used();

// Lógica de inicio de juego
global.weapons_found += 1;

// Si ya se recogieron las 2 armas
if (global.weapons_found >= 2)
{
    global.game_started = true;
    
    // Un pequeño efecto visual o sonido para indicar que empezó el caos
    //audio_play_sound(snd_gong, 1, false); 
    show_debug_message("¡EL JUEGO HA COMENZADO!");
}

instance_destroy()