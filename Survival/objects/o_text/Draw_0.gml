// --- Dibuja texto con sombra ---

// --- Configurar fuente y color principal ---
draw_set_font(f_menu);
draw_set_color(c_white);
draw_set_halign(fa_middle)

// --- Dibujar sombra ---
// Color de sombra (negro o gris oscuro)
draw_set_color(make_color_rgb(0, 0, 0));

// Dibujar sombra detrás del texto
draw_text_transformed(x + shadow_offset, y + shadow_offset, text, 2, 2, 0)

// --- Dibujar texto principal encima ---
draw_set_color(c_white);
draw_text_transformed(x, y, text, 2, 2, 0)