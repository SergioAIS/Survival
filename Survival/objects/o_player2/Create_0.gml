// --- MANDO ---
gamepad_slot = 4; // Por defecto PS4 suele ser 4. Si es Xbox es 0.

// --- INTERACCIÓN ---
// YA NO LA CREAMOS AQUÍ. Asumimos que o_inter_mask_p2 está en la room.
// Solo le pasamos el ID del mando para que sepa con cual interactuar.
o_inter_mask_p2.gamepad_slot = gamepad_slot;

// --- STATS (Igual al P1) ---
hp_max = 50;
hp = hp_max;
keys = 0;

att = 0;
weapon = "";
s_att_up = noone; s_att_right = noone; s_att_down = noone;
pick_axe = 0; pick_fire = 0; pick_ice = 0;
axe_dmg = 25

move = 1;
dir_mov = -1;
speed_mov = 0;
speed_mov_d = 0;
speed_max = 8;
accel = 1;
ori = 270;

dead = 0;
invi = 0;
invi_max = 60;