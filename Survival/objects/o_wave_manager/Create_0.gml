spawn_timer = 0;
spawn_radius = 600;

// --- CONFIGURACIÓN DE OLEADAS POR DÍA ---
// waves[DÍA] = { tasa_aparicion, [lista_de_enemigos] }
// rate: Frames entre enemigos (60 = 1 segundo). Menor número = Más frenético.
// types: Array con los objetos que pueden salir esa noche.

waves = [];

// DÍA 1: Solo enemigo básico, lento (cada 3 segundos)
waves[1] = { 
	rate: 180, 
	types: [o_enemy_bat] 
};

// DÍA 2: Mismo enemigo, pero mucho más frecuente (cada 1.5 segundos)
waves[2] = { 
	rate: 90, 
	types: [o_enemy_bat] 
};

// DÍA 3: Baja un poco la frecuencia (2 seg), pero añadimos un enemigo nuevo
// El juego elegirá aleatoriamente entre los dos tipos
waves[3] = { 
	rate: 120, 
	types: [o_enemy_bat, o_enemy_orc] 
};

// DÍA 4: Caos total (Rápido y mezclados)
waves[4] = { 
	rate: 70, 
	types: [o_enemy_bat, o_enemy_orc] 
};

// OLEADA POR DEFECTO (Para el día 5 en adelante, o si no defines un día)
default_wave = { 
	rate: 50, 
	types: [o_enemy_bat, o_enemy_orc, o_enemy_skeleton] 
};