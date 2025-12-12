surf = surface_create(room_width, room_height);

// --- CONFIGURACIÓN DE TIEMPO ---
seconds_per_cycle = 210; // 3.5 Minutos reales = 24 Horas en el juego
time = 0; // 0.0 = 00:00, 0.5 = 12:00, 1.0 = 24:00

// --- COLORES ---
color_night = merge_color(c_black, c_navy, 0.35); // Noche profunda
color_sunset = merge_color(c_black, c_orange, 0.4); // Atardecer

// Variables de dibujo
current_alpha = 0.95;
current_color = color_night;

// Variable lógica (para spawners, tiendas, etc.)
global.is_day = false;