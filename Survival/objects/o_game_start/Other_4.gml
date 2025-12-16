
global.previous_room = room;
global.respawn_room = Room1;
global.list_used = ds_list_create();
global.list_chat = ds_queue_create();
global.money = 1000;
global.is_night = 0
global.is_day = false;

global.game_started = false; // El juego empieza "apagado"
global.weapons_found = 0;    // Contador de armas recogidas
global.day_count = 1;        // Día 1
global.force_night_return = false;