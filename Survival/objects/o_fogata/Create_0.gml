// --- ESTADÍSTICAS ---
hp_max = 100;
hp = hp_max;

// --- MENU ---
menu_active = false;
menu_index = 0;
menu_options = [
	["Curar Jugador ($50)", 50],
	["Reparar Fogata ($100)", 100],
	["Mejorar Daño ($200)", 200],
	["Cerrar", 0]
];

// --- REFERENCIAS ---
// Ajusta esto si tu objeto jugador tiene otro nombre
player_obj = o_player;