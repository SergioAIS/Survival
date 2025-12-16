// 1. ENCONTRAR LÍMITES DE LOS JUGADORES
var _min_x = room_width;
var _max_x = 0;
var _min_y = room_height;
var _max_y = 0;
var _count = 0;

with (o_player) {
    _min_x = min(_min_x, x); _max_x = max(_max_x, x);
    _min_y = min(_min_y, y); _max_y = max(_max_y, y);
    _count++;
}
with (o_player2) {
    _min_x = min(_min_x, x); _max_x = max(_max_x, x);
    _min_y = min(_min_y, y); _max_y = max(_max_y, y);
    _count++;
}

// Solo mover si hay al menos un jugador vivo
if (_count > 0)
{
    // =============================================================
    // 2. CÁLCULO DE ZOOM (1366x768 a 2732x1536)
    // =============================================================
    
    // --- CONFIGURACIÓN ---
    var _base_w = 1366; 
    var _base_h = 768;
    var _max_scale = 2; // El doble de tamaño (Zoom Out máximo)
    var _buff = 200;    // Margen extra (padding) alrededor de los jugadores

    // Relación de aspecto (Aspect Ratio) de 1366/768
    var _aspect = _base_w / _base_h; 

    // --- CÁLCULO DEL TAMAÑO NECESARIO ---
    // Distancia horizontal entre jugadores + margen
    var _w_needed = (_max_x - _min_x) + (_buff * 2);
    
    // Distancia vertical + margen
    var _h_needed = (_max_y - _min_y) + (_buff * 2);

    // Convertimos la altura necesaria a ancho equivalente para comparar
    // (Si se separan mucho verticalmente, la cámara debe ensancharse para mantener el aspecto)
    var _w_from_h = _h_needed * _aspect;

    // Nos quedamos con el tamaño más grande necesario
    var _target_w = max(_w_needed, _w_from_h);

    // --- LIMITAR (CLAMP) ---
    // Mínimo: 1366, Máximo: 2732 (1366 * 2)
    _target_w = clamp(_target_w, _base_w, _base_w * _max_scale);
    
    // Calculamos la altura proporcional automáticamente
    var _target_h = _target_w / _aspect;

    // --- APLICAR ZOOM SUAVE ---
    var _curr_w = camera_get_view_width(view_camera[0]);
    var _curr_h = camera_get_view_height(view_camera[0]);

    var _new_w = lerp(_curr_w, _target_w, 0.05); // Velocidad de zoom (0.05 es suave)
    var _new_h = lerp(_curr_h, _target_h, 0.05);

    camera_set_view_size(view_camera[0], _new_w, _new_h);

    // =============================================================
    // 3. POSICIONAMIENTO (CENTRO)
    // =============================================================

    // Punto medio entre jugadores
    var _target_x = (_min_x + _max_x) / 2;
    var _target_y = (_min_y + _max_y) / 2;

    // Posición actual de la cámara (esquina superior izquierda)
    var _cam_x = camera_get_view_x(view_camera[0]);
    var _cam_y = camera_get_view_y(view_camera[0]);

    // Calcular destino: (Centro Jugadores) - (Mitad del Tamaño Nuevo de Cámara)
    var _dest_x = _target_x - (_new_w / 2);
    var _dest_y = _target_y - (_new_h / 2);

    // Evitar salir de la Room
    _dest_x = clamp(_dest_x, 0, room_width - _new_w);
    _dest_y = clamp(_dest_y, 0, room_height - _new_h);

    // Movimiento suave
    var _final_x = lerp(_cam_x, _dest_x, 0.1); // Velocidad de seguimiento (0.1 es rápido)
    var _final_y = lerp(_cam_y, _dest_y, 0.1);

    camera_set_view_pos(view_camera[0], _final_x, _final_y);
}