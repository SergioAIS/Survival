surf = surface_create(room_width, room_height);

// --- CONFIGURACIÓN DE TIEMPO ---
seconds_per_cycle = 30; // 3.5 min
time = 0.3; // Empezamos en la mañana (0.3)

// --- COLORES ---
color_night = merge_color(c_black, c_navy, 0.35); 
color_sunset = merge_color(c_black, c_orange, 0.4); 

// Variables de dibujo
current_alpha = 0;
current_color = c_white;

// Variable lógica
global.is_day = true;