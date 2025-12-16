// --- OBTENER COORDENADAS Y DIMENSIONES ---
var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);
var _cam_w = camera_get_view_width(view_camera[0]);

// Obtenemos el ancho real del HUD para hacer los cálculos
var _hud_width = sprite_get_width(s_HUD); 
// Calculamos el offset (distancia) entre donde empieza el sprite y donde va el texto
// En el P1: Texto (123) - Sprite (40) = 83 pixeles de diferencia
var _text_offset_x = 123 - 40; 

// ========================================================
// --- HUD PLAYER 1 (IZQUIERDA) ---
// ========================================================

// 1. Sprite Fondo
draw_sprite(s_HUD, 0, _cam_x + 40, _cam_y + 28);

// 2. Configurar Texto
draw_set_font(f_float_text);
draw_set_halign(fa_left);

// 3. Vida (HP)
draw_set_color(make_color_rgb(244, 67, 54));
if (instance_exists(o_player)) {
    draw_text(_cam_x + 40 + _text_offset_x, _cam_y + 50, o_player.hp);
}

// 4. Llaves
draw_set_color(c_white);
if (instance_exists(o_player)) {
    draw_text(_cam_x + 40 + _text_offset_x, _cam_y + 100, o_player.keys);
}

// ========================================================
// --- HUD PLAYER 2 (DERECHA - SIN ESPEJO) ---
// ========================================================

if (instance_exists(o_player2))
{
    // CÁLCULO DE POSICIÓN X
    // Posición = (Borde Derecho Cámara) - (Margen 40) - (Ancho del Sprite)
    var _p2_hud_x = _cam_x + _cam_w - 40 - _hud_width;
    
    // 1. Sprite Fondo (Normal, xscale 1)
    draw_sprite(s_HUD, 0, _p2_hud_x, _cam_y + 28);

    // 2. Configurar Texto
    // Mantenemos fa_left porque el sprite no está volteado, 
    // así que el hueco para el texto sigue estando a la derecha del icono
    draw_set_halign(fa_left); 

    // 3. Vida (HP)
    // Usamos azul para diferenciar (o cámbialo al rojo si prefieres)
    draw_set_color(make_color_rgb(67, 140, 244)); 
    
    // La posición del texto es: Posición Inicio HUD + El mismo offset que usa el P1
    draw_text(_p2_hud_x + _text_offset_x, _cam_y + 50, o_player2.hp);

    // 4. Llaves
    draw_set_color(c_white);
    draw_text(_p2_hud_x + _text_offset_x, _cam_y + 100, o_player2.keys);
}

