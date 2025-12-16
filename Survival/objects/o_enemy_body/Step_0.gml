if (hp <= 0)
{	
	instance_destroy()
}

if (invi > 0)
{
	invi -= 1
}

// --- MÁQUINA DE ESTADOS SIMPLE ---
var _target = noone;
var _dist_aggro = 150; // Distancia para que se fije en el jugador solo al pasar cerca

// 1. Buscar jugador más cercano (usando el padre o_players)
var _nearest_player = instance_nearest(x, y, o_players);

// 2. Decidir objetivo
// Si el jugador está muy cerca O el enemigo recibió daño (necesitas variable 'hit')
if (distance_to_object(_nearest_player) < _dist_aggro) // O agregar: || hp < hp_max
{
    _target = _nearest_player;
}
else
{
    // Si nadie molesta, vamos por la fogata
    if (instance_exists(o_fogata)) _target = o_fogata;
}

// 3. Moverse hacia el objetivo
if (_target != noone)
{
    // mp_potential_step evita obstáculos sólidos
    mp_potential_step(_target.x, _target.y, 2, false);
    
    // Rotar sprite
    if (_target.x > x) image_xscale = 1; else image_xscale = -1;
}