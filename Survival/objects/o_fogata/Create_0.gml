// --- ESTADÍSTICAS ---
hp_max = 500;
hp = hp_max;

// --- MENU ---
menu_active = false;
menu_index = 0;
menu_options = [
	["Curar Jugador ($50)", 50],
	["Reparar Fogata ($100)", 100],
	["Mejorar Hacha ($200)", 200],
	["Cerrar", 0]
];



// --- CONTROL GAMEPAD (NUEVO) ---
gamepad_slot = 4; // Asegúrate de que coincida con el del P2 (0 o 4)
stick_pushed = false; // "Freno" para el joystick
menu_cooldown = 0;    // Para evitar que se abra y cierre al instante

audio_play_sound(snd_fogata_1,1,1)