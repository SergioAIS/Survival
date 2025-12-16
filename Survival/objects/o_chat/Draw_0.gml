// --- 1. DIBUJAR SCREENSHOT (FONDO) ---
// Estiramos la foto para cubrir toda la cámara actual
if (sprite_exists(s_screen)) {
    draw_sprite_stretched(s_screen, 0, camera_x, camera_y, camera_w, camera_h);
}

// Oscurecer un poco (Opcional)
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(camera_x, camera_y, camera_x + camera_w, camera_y + camera_h, false);
draw_set_alpha(1);
draw_set_color(c_white);


// --- 2. CALCULAR ESCALA (LA CLAVE) ---
// Definimos tu resolución base (donde los números 265 y 490 se veían bien)
var _base_w = 1366; // O usa 1250 si esa era tu base original

// Calculamos cuánto ha crecido la cámara
// Si la cámara mide 2732, el scale será 2.
var _scale = camera_w / _base_w;


// --- 3. DIBUJAR CAJA DE TEXTO (ESCALADA) ---
// Multiplicamos la posición original (265, 490) por la escala
var _box_x = camera_x + (265 * _scale);
var _box_y = camera_y + (490 * _scale);

draw_sprite_ext(s_fondo_texto, 0, _box_x, _box_y, _scale, _scale, 0, c_white, 1);


// --- 4. DIBUJAR TEXTO (COORDINADO) ---
draw_set_font(f_menu);
draw_set_halign(fa_left);

// Calculamos la posición del texto basándonos en la posición de la caja
// Antes: 315 (texto) - 265 (caja) = 50 pixeles de diferencia en X
// Antes: 530 (texto) - 490 (caja) = 40 pixeles de diferencia en Y
var _padding_x = 50 * _scale;
var _padding_y = 40 * _scale;

var _text_x = _box_x + _padding_x;
var _text_y = _box_y + _padding_y;

// Usamos draw_text_ext_transformed para poder cambiar el tamaño de la letra (scale)
// El ancho de separación (650) también se multiplica por scale
draw_text_ext_transformed(_text_x, _text_y, chat, -1, 650 * _scale, _scale, _scale, 0);