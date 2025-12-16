// stats -----------------

hp = 25;
dmg = 5;

speed_max = 4; 
range = 350;

// control ---------------

invi = 0;
invi_max = 30;

active = 0;
dir_mov = -1;

image_speed = 0;

// Control de ataque
attack_distance = 8;
attack_cooldown = 60;
can_attack = true;

enum E_EYE_STATE {
    IDLE,     // Esperando a detectar al jugador
    FLY,      // Siguiendo al jugador (activo)
    ATTACK,   // Ejecutando el ataque
    HIT,      // Recibiendo daño (invisibilidad)
    DEAD      // Muriendo
}

state = E_EYE_STATE.IDLE;