// Calcular punto medio entre todos los jugadores
var _min_x = room_width;
var _max_x = 0;
var _min_y = room_height;
var _max_y = 0;
var _count = 0;

with (o_player) { // P1
	_min_x = min(_min_x, x); _max_x = max(_max_x, x);
	_min_y = min(_min_y, y); _max_y = max(_max_y, y);
	_count++;
}
with (o_player2) { // P2
	_min_x = min(_min_x, x); _max_x = max(_max_x, x);
	_min_y = min(_min_y, y); _max_y = max(_max_y, y);
	_count++;
}

if (_count > 0)
{
	// Centro promedio
	var _target_x = (_min_x + _max_x) / 2;
	var _target_y = (_min_y + _max_y) / 2;

	var _cam_x = camera_get_view_x(view_camera[0]);
	var _cam_y = camera_get_view_y(view_camera[0]);
	var _w = camera_get_view_width(view_camera[0]);
	var _h = camera_get_view_height(view_camera[0]);

	// Suavizado
	var _new_x = lerp(_cam_x, _target_x - (_w/2), 0.1);
	var _new_y = lerp(_cam_y, _target_y - (_h/2), 0.1);
	
	// Limites
	_new_x = clamp(_new_x, 0, room_width - _w);
	_new_y = clamp(_new_y, 0, room_height - _h);

	camera_set_view_pos(view_camera[0], _new_x, _new_y);
}