draw_self();
draw_set_font(f_text)
// Barra de vida de la fogata
if (hp < hp_max)
{
	var _pc = (hp / hp_max) * 100;
	draw_healthbar(x-20, y-50, x+20, y-45, _pc, c_black, c_red, c_lime, 0, true, true);
}

// Menú
if (menu_active)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	// Fondo semitransparente para leer mejor
	draw_set_color(c_black);
	draw_set_alpha(0.8);
	draw_rectangle(x-70, y-140, x+70, y-60, false);
	draw_set_alpha(1);
	
	// Opciones
	for (var i = 0; i < array_length(menu_options); i++)
	{
		var _col = c_white;
		var _txt = menu_options[i][0];
		
		if (i == menu_index) {
			_col = c_yellow;
			_txt = "> " + _txt + " <";
		}
		
		// Si no alcanza el dinero y no es la opción "Cerrar" (costo 0)
		if (menu_options[i][1] > global.money) _col = c_gray;
		
		draw_text_color(x, y-130 + (i * 20), _txt, _col, _col, _col, _col, 1);
	}
}