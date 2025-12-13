// 1. Dibujamos la fogata (IMPORTANTE: Si no pones esto, la fogata se vuelve invisible)
draw_self();

// 2. BARRA DE VIDA (Estilo "Live Bar")
// Configuración
var _bar_width = 60;  // Ancho de la barra en pixeles
var _bar_height = 8;  // Alto de la barra
var _x_offset = x - (_bar_width / 2); // Centrar en X
var _y_offset = y - 50; // Altura (50 pixeles arriba del origen)

// Calcular porcentaje de vida (0 a 1)
var _hp_percent = hp / hp_max;

// Dibujar Fondo (Caja Negra / Borde)
draw_set_color(c_black);
draw_rectangle(_x_offset - 2, _y_offset - 2, _x_offset + _bar_width + 2, _y_offset + _bar_height + 2, false);

// Dibujar Vida Roja (Fondo de daño)
draw_set_color(c_maroon); // Rojo oscuro
draw_rectangle(_x_offset, _y_offset, _x_offset + _bar_width, _y_offset + _bar_height, false);

// Dibujar Vida Verde (Vida actual)
if (hp > 0)
{
	draw_set_color(c_lime); // Verde brillante
	draw_rectangle(_x_offset, _y_offset, _x_offset + (_bar_width * _hp_percent), _y_offset + _bar_height, false);
}

// Resetear color (Buena práctica)
draw_set_color(c_white);