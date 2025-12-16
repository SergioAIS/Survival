// ========================================================
// --- 1. CONFIGURACIÓN INICIAL ---
// ========================================================
var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();
var _center_x = _gui_w / 2;

// Fuentes y Alineación por defecto
draw_set_font(f_float_text); // Asegúrate de que esta fuente existe
draw_set_valign(fa_top);

// ========================================================
// --- 4. DÍA Y RELOJ (CENTRO ARRIBA) ---
// ========================================================
if (instance_exists(o_dark))
{
    // --- A. DIBUJAR EL DÍA ---
    // Lo ponemos un poco más arriba (y = 5) para que encabece la lista
    draw_set_halign(fa_center);
    draw_set_color(c_white); // O un color distinto si quieres
    draw_text(_center_x, 4, "DIA " + string(global.day_count));

    // --- B. CÁLCULO DEL RELOJ ---
    var _total_minutes = o_dark.time * 1440;
    var _hours = floor(_total_minutes / 60);
    var _mins = floor(_total_minutes % 60);
    
    var _suffix = " A.M.";
    if (_hours >= 12) { _suffix = " P.M."; if (_hours > 12) _hours -= 12; }
    if (_hours == 0) _hours = 12;
    
    var _mins_str = (_mins < 10) ? "0" + string(_mins) : string(_mins);
    var _time_txt = string(_hours) + ":" + _mins_str + _suffix;
    
    // --- C. DIBUJAR RELOJ ---
    draw_set_color(c_yellow);
    draw_text(_center_x, 30, _time_txt);
}

// ========================================================
// --- 5. DINERO (CENTRO ABAJO DEL RELOJ) ---
// ========================================================
// Este va fuera del "if (o_dark)" para verse siempre

draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(_center_x, 55, "$ " + string(global.money));

// ========================================================
// --- 6. DEBUG (ESQUINA INFERIOR) ---
// ========================================================
draw_set_halign(fa_right);
draw_set_color(c_yellow);
// Usar una fuente más pequeña o por defecto para debug
draw_set_font(-1); 
draw_text(_gui_w - 10, _gui_h - 20, "Room: " + string(global.previous_room));

// Reset final
draw_set_halign(fa_left);
draw_set_color(c_white);