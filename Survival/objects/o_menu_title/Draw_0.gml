draw_set_font(f_menu); // Tu fuente medieval
draw_set_valign(fa_middle);
draw_set_halign(fa_center); // IMPORTANTE: Centrar texto

// Calculamos el ancho total del menú para centrarlo
// (op_space * número de huecos entre opciones)
var _total_width = op_space * (array_length(options) - 1);

// Calculamos dónde empieza la primera opción (a la izquierda del centro)
var _start_x = x - (_total_width / 2);

for (var i = 0; i < array_length(options); i++)
{
    var _color = c_gray; // Color apagado para las no seleccionadas
    var _scale = 1;
    var _txt = options[i];
    
    // Calcular posición X de ESTA opción
    var _xx = _start_x + (op_space * i);
    var _yy = y; // La altura es fija para todos
    
    // Si está seleccionada
    if (i == menu_index)
    {
        _color = c_white;  // Color brillante
        _scale = 1.2;      // Más grande
        _txt = "- " + _txt + " -"; // Decoración extra
        
        // Opcional: Hacer que la seleccionada suba un poquito (efecto brinco)
        _yy -= 5; 
    }
    
    // Sombra (para que se lea bien sobre el fondo del juego)
    draw_set_color(c_black);
    draw_text_transformed(_xx + 2, _yy + 2, _txt, _scale, _scale, 0);
    
    // Texto Real
    draw_set_color(_color);
    draw_text_transformed(_xx, _yy, _txt, _scale, _scale, 0);
}

// Reset
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);