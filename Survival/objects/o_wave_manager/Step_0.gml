// 1. CONDICIONES PARA NO SPAWNEAR
if (global.game_started == false) exit;
if (!instance_exists(o_fogata)) exit;

// 2. SOLO SPAWNEAR SI ES DE NOCHE
if (global.is_day == false)
{
	spawn_timer--;
	
	if (spawn_timer <= 0)
	{
		// --- OBTENER DATOS DE LA OLEADA ACTUAL ---
		var _current_wave_data;
		
		// Verificamos si hemos definido una configuración para el día actual
		if (global.day_count < array_length(waves) && waves[global.day_count] != undefined)
		{
			_current_wave_data = waves[global.day_count];
		}
		else
		{
			// Si pasamos del día 4 (o el que hayas definido), usamos la por defecto
			_current_wave_data = default_wave;
		}
		
		// 1. Resetear Timer (Usamos el rate definido en el Create)
		spawn_timer = _current_wave_data.rate;
		
		
		// --- ELEGIR POSICIÓN (Igual que antes) ---
		var _angle = random(360);
		var _xx = o_fogata.x + lengthdir_x(spawn_radius, _angle);
		var _yy = o_fogata.y + lengthdir_y(spawn_radius, _angle);
		
		_xx = clamp(_xx, 50, room_width - 50);
		_yy = clamp(_yy, 50, room_height - 50);
		
		
		// --- ELEGIR Y CREAR ENEMIGO ---
		
		// a) Obtenemos la lista de enemigos posibles para hoy
		var _possible_enemies = _current_wave_data.types;
		
		// b) Elegimos uno al azar de la lista
		// irandom(n) devuelve un entero entre 0 y n.
		var _index = irandom(array_length(_possible_enemies) - 1);
		var _enemy_obj = _possible_enemies[_index];
		
		// c) Creamos el enemigo específico
		instance_create_layer(_xx, _yy, "Instances", _enemy_obj);
		
		// NOTA: Como ahora creas enemigos específicos (ej: o_skeleton),
		// ya no necesitas el bloque 'with' para cambiarles la vida manualmente
		// a menos que quieras que un mismo esqueleto tenga más vida el día 10.
	}
}
else
{
	// Resetear timer durante el día
	spawn_timer = 120;
}