// 1. FRENO DE INICIO DE JUEGO
// Si no ha empezado, forzamos que sea de día (mañana) y salimos
if (global.game_started == false) 
{
	time = 0.3; 
	global.is_day = true;
	exit; 
}

// 2. AVANZAR TIEMPO
time += (1 / room_speed) / seconds_per_cycle;

// --- CAMBIO DE DÍA (CONTADOR) ---
if (time >= 1) 
{
	time = 0; 
	global.day_count += 1; // ¡Sumamos un día!
	show_debug_message("Día nuevo: " + string(global.day_count));
}

// --- DEFINICIÓN DE HORARIOS (Tus horarios originales) ---
var _h_sunrise_start = 5 / 24;   
var _h_sunrise_end   = 7.5 / 24; 
var _h_sunset_start  = 18 / 24;  
var _h_sunset_end    = 20 / 24;  

// 3. CÁLCULO VISUAL
if (time >= _h_sunrise_start and time < _h_sunrise_end) 
{
	var _progress = (time - _h_sunrise_start) / (_h_sunrise_end - _h_sunrise_start);
	current_alpha = lerp(0.95, 0, _progress); 
	current_color = color_night; 
}
else if (time >= _h_sunrise_end and time < _h_sunset_start)
{
	current_alpha = 0; 
	current_color = c_white;
}
else if (time >= _h_sunset_start and time < _h_sunset_end)
{
	var _progress = (time - _h_sunset_start) / (_h_sunset_end - _h_sunset_start);
	current_alpha = lerp(0, 0.95, _progress); 
	current_color = color_sunset; 
}
else
{
	current_alpha = 0.95;
	current_color = color_night;
}

// 4. LÓGICA DE JUEGO (DÍA vs NOCHE)
var _logic_day_start = 6 / 24;  
var _logic_day_end   = 18 / 24; 

if (time >= _logic_day_start and time < _logic_day_end)
{
	global.is_day = true;
}
else
{
	global.is_day = false;
}