// 1. CONDICIONES PARA NO SPAWNEAR
if (global.game_started == false) exit;
if (!instance_exists(o_fogata)) exit;

// 2. SOLO SPAWNEAR SI ES DE NOCHE
if (global.is_day == false)
{
	// --- LÓGICA DE JEFE (PORTADOR) ---
    // Solo si NO ha salido hoy todavía
    if (boss_spawned_today == false)
    {
        var _boss_type = noone;
        var _key_color = "";
        var _key_id = 0;

        // DEFINIR CALENDARIO DE LLAVES
        if (global.day_count == 3) { // DÍA 3: LLAVE ROJA
            _boss_type = o_enemy_bearer; 
            _key_color = "red";
            _key_id = 0;
        }
        else if (global.day_count == 6) { // DÍA 6: LLAVE AZUL
            _boss_type = o_enemy_bearer; // Podría ser otro objeto o_slime_boss
            _key_color = "blue";
            _key_id = 1;
        }
        
        // SI TOCA JEFE HOY, CREARLO
        if (_boss_type != noone)
        {
            // Posición aleatoria lejos
            var _ang = random(360);
            var _bx = o_fogata.x + lengthdir_x(spawn_radius, _ang);
            var _by = o_fogata.y + lengthdir_y(spawn_radius, _ang);
            
            // Crear Boss
            var _inst = instance_create_layer(_bx, _by, "Instances", _boss_type);
            
            // Configurar qué llave trae
            _inst.key_to_drop = _key_color;
            _inst.key_sprite_id = _key_id;
            
            // Marcar que ya salió para que no salgan infinitos jefes esta noche
            boss_spawned_today = true;
            
            show_debug_message("¡BOSS SPAWNED! Key: " + _key_color);
        }
        else
        {
            // Si hoy no toca jefe, marcamos true para dejar de preguntar
            boss_spawned_today = true; 
        }
    }
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
	// ES DE DÍA
    spawn_timer = 120;
    
    // IMPORTANTE: Reseteamos la bandera del jefe para la próxima noche
    boss_spawned_today = false;
}