// --- OBTENER COORDENADAS DE CÁMARA ---
camera_x = camera_get_view_x(view_camera[0]);
camera_y = camera_get_view_y(view_camera[0]);

// --- DIBUJAR HUD (BASE) ---
draw_sprite(s_HUD, 0, camera_x + 40, camera_y + 28);

// --- DIBUJAR VIDA (HP) ---
draw_set_color(make_color_rgb(244, 67, 54));
draw_set_font(f_float_text);
draw_set_halign(fa_left);
draw_text(camera_x + 123, camera_y + 50, o_player.hp);

// --- DIBUJAR LLAVES ---
draw_set_color(c_white);
draw_text(camera_x + 123, camera_y + 100, o_player.keys);

// ========================================================
// --- CÁLCULO Y DIBUJO DEL RELOJ DIGITAL ---
// ========================================================

if (instance_exists(o_dark))
{
    // 1. Convertir el tiempo (0.0 a 1.0) a minutos totales del día (0 a 1440)
    var _total_minutes = o_dark.time * 1440;
    
    // 2. Obtener horas y minutos
    var _hours = floor(_total_minutes / 60);
    var _mins = floor(_total_minutes % 60);
    
    // 3. Formatear sufijo (AM/PM) y convertir formato 24h a 12h
    var _suffix = " A.M.";
    
    if (_hours >= 12) 
    {
        _suffix = " P.M.";
        if (_hours > 12) _hours -= 12;
    }
    
    if (_hours == 0) _hours = 12; // Para que medianoche sea 12 A.M.
    
    // 4. Asegurar que los minutos tengan un cero adelante si son menores a 10 (ej: 11:05)
    var _mins_str = string(_mins);
    if (_mins < 10) _mins_str = "0" + _mins_str;
    
    // 5. Crear el texto final
    var _time_txt = string(_hours) + ":" + _mins_str + _suffix;
    
    // 6. Dibujar el reloj (A la derecha de la vida)
    // Usamos un color amarillento o blanco para que resalte
    draw_set_color(c_yellow); 
    // Ajusta el +200 si lo quieres más cerca o lejos
    draw_text(camera_x + 200, camera_y + 50, _time_txt);
}