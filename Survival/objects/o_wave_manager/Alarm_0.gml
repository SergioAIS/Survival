// Solo spawnea si es de NOCHE y el juego ya empezó
// Asumimos que o_dark.time > 0.5 es noche (ajusta según tu lógica)
if (instance_exists(o_dark) && instance_exists(o_fogata))
{
    if (o_dark.is_night) // Variable que debes tener en o_dark o chequear (time > X)
    {
        // 1. Elegir un ángulo aleatorio (0 a 360 grados)
        var _angle = random(360);
        
        // 2. Calcular posición alrededor de la fogata
        var _spawn_x = o_fogata.x + lengthdir_x(radius, _angle);
        var _spawn_y = o_fogata.y + lengthdir_y(radius, _angle);
        
        // 3. Crear el enemigo
        instance_create_layer(_spawn_x, _spawn_y, "Instances", o_enemy);
    }
}

// Reiniciar alarma (quizás más rápido cada día que pasa)
var _new_rate = max(20, 120 - (global.day_count * 3)); // Cada día spawnean más rápido
alarm[0] = _new_rate;