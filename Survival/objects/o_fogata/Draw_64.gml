if (menu_active)
{
	// --- CONFIGURACIÓN VISUAL ---
	var _gui_w = display_get_gui_width();
	var _gui_h = display_get_gui_height();
	
	// Tamaño de la caja del menú (Más grande como pediste)
	var _box_w = 400; 
	var _box_h = 300;
	
	// Posición central
	var _x1 = (_gui_w / 2) - (_box_w / 2);
	var _y1 = (_gui_h / 2) - (_box_h / 2);
	var _x2 = _x1 + _box_w;
	var _y2 = _y1 + _box_h;
	
	// --- DIBUJAR FONDO ---
	// Hacemos que sea medio transparente para que se vea elegante
	draw_set_alpha(0.90); 
	draw_set_color(c_dkgray); // Gris oscuro de fondo
	draw_rectangle(_x1, _y1, _x2, _y2, false);
	
	// Borde del menú
	draw_set_alpha(1);
	draw_set_color(c_white); 
	draw_rectangle(_x1, _y1, _x2, _y2, true); // "true" es solo contorno
	
	// --- DIBUJAR TEXTO ---
	draw_set_halign(fa_center); // Centrar texto horizontalmente
	draw_set_valign(fa_middle); // Centrar texto verticalmente
	
	// Título del Menú
	draw_set_color(c_yellow);
	draw_text(_gui_w / 2, _y1 + 40, "- HOGUERA -");
	draw_set_color(c_white);
	
	// Opciones
	for (var i = 0; i < array_length(menu_options); i++)
	{
		var _opcion = menu_options[i][0];
		var _txt_y = _y1 + 100 + (i * 40); // Espacio entre líneas
		
		// Color si está seleccionado
		if (i == menu_index) 
		{
			draw_set_color(c_yellow);
			_opcion = "> " + _opcion + " <"; // Añadir flechas visuales
		}
		else 
		{
			draw_set_color(c_white);
		}
		
		draw_text(_gui_w / 2, _txt_y, _opcion);
	}
	
	// Resetear alineación y color (Para no romper otros dibujos)
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
}