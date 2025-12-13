// 1. Borrar el sprite de la memoria (¡Vital!)
if (sprite_exists(s_screen)) sprite_delete(s_screen);

// 2. Reactivar todas las instancias del juego
instance_activate_all();