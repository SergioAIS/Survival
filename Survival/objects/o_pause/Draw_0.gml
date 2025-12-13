// 1. DIBUJAR LA FOTO CONGELADA
// Esto tapa el juego real (que está desactivado e invisible)
if (sprite_exists(s_screen)) {
	draw_sprite(s_screen, 0, camera_x, camera_y);
}

// 2. OSCURECER PANTALLA
// Dibujamos un rectángulo negro semitransparente para que se note que es pausa
draw_set_alpha(0.6);
draw_set_color(c_black);
draw_rectangle(camera_x, camera_y, camera_x + view_w, camera_y + view_h, false);
draw_set_alpha(1);
draw_set_color(c_white);

// 3. DIBUJAR TEXTO DEL MENÚ
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
// draw_set_font(f_tu_fuente); // Descomenta y pon tu fuente aquí

var _center_x = camera_x + (view_w / 2);
var _center_y = camera_y + (view_h / 2);

// Título
draw_text_transformed(_center_x, _center_y - 80, "- PAUSA -", 2, 2, 0);

// Opciones
for (var i = 0; i < array_length(menu_options); i++)
{
	var _txt = menu_options[i];
	var _col = c_white;
	var _scale = 1;
	
	if (i == menu_index) {
		_col = c_yellow; // Color selección
		_txt = "> " + _txt + " <";
		_scale = 1.2;
	}
	
	draw_set_color(_col);
	draw_text_transformed(_center_x, _center_y + (i * 50), _txt, _scale, _scale, 0);
}

// Resetear
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);