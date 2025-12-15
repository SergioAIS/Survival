// 1. AVANZAR TIEMPO
time += (1 / room_speed) / seconds_per_cycle;
if (time >= 1) time = 0; // Reinicio a medianoche

// --- DEFINICIÓN DE HORARIOS CLAVE (Normalizados de 0 a 1) ---
var _h_sunrise_start = 5 / 24;   // 5:00 AM (0.208)
var _h_sunrise_end   = 7.5 / 24; // 7:30 AM (0.3125)
var _h_sunset_start  = 18 / 24;  // 6:00 PM (0.75)
var _h_sunset_end    = 20 / 24;  // 8:00 PM (0.833) - Le damos 2 horas para oscurecer completo

// 2. CÁLCULO VISUAL (LUCES Y SOMBRAS)
if (time >= _h_sunrise_start && time < _h_sunrise_end) 
{
    // === AMANECER (5:00 a 7:30) ===
    // Calculamos qué porcentaje del amanecer llevamos (0 a 1)
    var _progress = (time - _h_sunrise_start) / (_h_sunrise_end - _h_sunrise_start);
    
    current_alpha = lerp(0.95, 0, _progress); // De oscuro (0.95) a claro (0)
    current_color = color_night; // Mantenemos tinte azulado mientras aclara
}
else if (time >= _h_sunrise_end && time < _h_sunset_start)
{
    // === DÍA PLENO (7:30 a 18:00) ===
    current_alpha = 0; // Transparente
    current_color = c_white;
}
else if (time >= _h_sunset_start && time < _h_sunset_end)
{
    // === ATARDECER (18:00 a 20:00) ===
    var _progress = (time - _h_sunset_start) / (_h_sunset_end - _h_sunset_start);
    
    current_alpha = lerp(0, 0.95, _progress); // De claro (0) a oscuro (0.95)
    current_color = color_sunset; // Tinte naranja rojizo
}
else
{
    // === NOCHE PROFUNDA (20:00 a 05:00) ===
    current_alpha = 0.95;
    current_color = color_night;
}

// 3. LÓGICA DE JUEGO (DÍA vs NOCHE)
// Pediste que el día se considere de 6:00 AM a 6:00 PM estricto
var _logic_day_start = 6 / 24;  // 0.25
var _logic_day_end   = 18 / 24; // 0.75

if (time >= _logic_day_start and time < _logic_day_end)
{
    global.is_day = true;
}
else
{
    global.is_day = false;
}