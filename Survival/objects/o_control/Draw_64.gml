draw_set_color(c_yellow);
draw_set_halign(fa_left);
draw_set_font(f_text)

draw_text(10, 10, "Buscando mandos...");

var _found = false;
for (var i = 0; i < 12; i++) // Revisamos los primeros 12 slots
{
    if (gamepad_is_connected(i))
    {
        var _desc = gamepad_get_description(i);
        draw_text(10, 30 + (i * 20), "Slot " + string(i) + ": CONECTADO - " + _desc);
        _found = true;
        
        // Ver si se están apretando botones (Prueba de input)
        if (gamepad_button_check(i, gp_face1)) draw_text(300, 30 + (i*20), "[X] Presionado");
        if (gamepad_axis_value(i, gp_axislh) != 0) draw_text(450, 30 + (i*20), "Stick Moviendose");
    }
}

if (!_found) draw_text(10, 30, "No se detecta ningun mando.");