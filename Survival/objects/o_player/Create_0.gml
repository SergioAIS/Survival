
// Stats -----------------------------

hp_max = 500;
hp = hp_max;

keys= 0;

// Ataque ----------------------------

att = 0;
weapon = "";

s_att_up = noone;
s_att_right = noone;
s_att_down = noone;

pick_axe = 0;
pick_fire = 0;

// Movimiento ------------------------

move = 1;

dir_mov = -1;
speed_mov = 0;
speed_mov_d = 0;

speed_max = 8;
accel = 1;

ori = 270;

// control ---------------------------

dead = 0;
invi = 0;
invi_max = 60;

// Identificación
player_id = 0;   // 0 = P1, 1 = P2
gamepad_slot = -1; // -1 = Teclado. Si detectamos mando, guardaremos aquí el ID (ej. 0 o 4)

// Inventario para ciclado (Necesario para el mando)
// Asumo que "axe" y "fire" son los strings que usas en scr_change_weapon
weapons_list = ["axe", "fire"]; 
current_weapon_index = 0;