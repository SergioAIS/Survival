// 1. ELEGIR OBJETIVO (Esta parte ya la tenías o parecida)
var _player = instance_nearest(x, y, o_players);
var _aggro_dist = 150; 

// Prioridad: Jugador si está cerca, sino Fogata
if (_player != noone && distance_to_object(_player) < _aggro_dist) {
    target = _player;
} else if (instance_exists(o_fogata)) {
    target = o_fogata;
}

// 2. LOGICA DE MOVIMIENTO Y ATAQUE
if (instance_exists(target))
{
    // Calculamos distancia al objetivo
    var _dist = distance_to_object(target);
    
    // SI ESTAMOS CERCA: ATACAR
    if (_dist <= range) 
    {
        speed = 0; // Dejar de moverse
        
        // Gestión del Cooldown
        if (attack_cooldown > 0) {
            attack_cooldown--;
        }
        else {
            // ¡GOLPE!
            target.hp -= damage;
            attack_cooldown = attack_speed; // Reiniciar temporizador
            
            // Efecto visual (Opcional: Vibración o Flash)
            // with(target) { hit_flash = 3; } 
        }
    }
    // SI ESTAMOS LEJOS: MOVERSE
    else 
    {
        move_towards_point(target.x, target.y, 1.5); // Tu velocidad de movimiento
        
        // Orientación del sprite
        if (target.x > x) image_xscale = 1; else image_xscale = -1;
    }
}