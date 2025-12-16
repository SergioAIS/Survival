// 1. CONDICIONES PARA NO SPAWNEAR
if (global.game_started == false) exit;
if (!instance_exists(o_fogata)) exit;

// 2. SOLO SPAWNEAR SI ES DE NOCHE
if (global.is_day == false)
{
	spawn_timer--;
	
	if (spawn_timer <= 0)
	{
		// --- CÁLCULO DE DIFICULTAD PROGRESIVA ---
		// Día 1: Spawn cada 180 frames (3 seg)
		// Día 5: Spawn cada 100 frames (1.6 seg)
		// Mínimo: 40 frames
		var _rate = max(40, 180 - (global.day_count * 20));
		spawn_timer = _rate;
		
		// --- ELEGIR POSICIÓN ---
		var _angle = random(360);
		var _xx = o_fogata.x + lengthdir_x(spawn_radius, _angle);
		var _yy = o_fogata.y + lengthdir_y(spawn_radius, _angle);
		
		// Evitar aparecer fuera de la room
		_xx = clamp(_xx, 50, room_width - 50);
		_yy = clamp(_yy, 50, room_height - 50);
		
		// --- CREAR ENEMIGO ---
		var _enemy = instance_create_layer(_xx, _yy, "Instances", o_skeleton);
		
		// Configurar stats del enemigo según el día (Escalado de poder)
		with (_enemy)
		{
			hp_max = 20 + (global.day_count * 3); // +5 HP por día
			hp = hp_max;
			// dmg = 5 + global.day_count; // Si tienes variable de daño
		}
	}
}
else
{
	// Si es de día, reseteamos el timer para que al caer la noche
	// no aparezca uno instantáneamente.
	spawn_timer = 120;
}