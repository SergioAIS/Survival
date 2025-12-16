// --- FOTO DE PANTALLA (Igual que o_chat) ---
// Capturamos lo que se ve en pantalla para congelarlo
s_screen = sprite_create_from_surface(application_surface, 0, 0, 1250, 720, 0, 0, 0, 0);

// Desactivamos TODO excepto este objeto
// Esto congela la lógica del juego (enemigos, jugadores, físicas)
instance_deactivate_all(true);

// --- VARIABLES DEL MENÚ ---
menu_index = 0;
menu_options = ["CONTINUAR", "SALIR"];

// Coordenadas de la cámara para dibujar
camera_x = camera_get_view_x(view_camera[0]);
camera_y = camera_get_view_y(view_camera[0]);
view_w = camera_get_view_width(view_camera[0]);
view_h = camera_get_view_height(view_camera[0]);

// Control
gamepad_slot = 4; // Ajusta a 0 o 4 según tu config
menu_cooldown = 10; // Pequeña espera para no seleccionar al instante
stick_pushed = false;

audio_play_sound(snd_pause,1,0)