// --- DEATH ---
if(hp <= 0 and !dead)
{
	dead = 1;
	move = 0; dir_mov = -1; speed_mov = 0; speed_mov_d = 0; att = 0; invi = 999;
	visible = 0;
	instance_create_depth(x,y,depth-300,o_blood);
	alarm[1] = 100;
	if(instance_exists(my_mask)) instance_destroy(my_mask);
}

if(move)
{
	// 1. INPUT
	scr_input_p2();

	// 2. ATAQUE
	if(gamepad_button_check(gamepad_slot, gp_face1) and weapon != "")
	{
		dir_mov = -1;
		att = 1;
		move = 0;
		scr_att_p2();
	}

	// 3. VELOCIDAD
	// Si el input detectó movimiento (dir_mov != -1)
	if(dir_mov != -1)
	{
		if(speed_mov < speed_max)
		{
			speed_mov += accel;
			// Calculamos la velocidad diagonal (aunque scr_desplazamiento_p2 usa vectores,
			// mantenemos esto por si usas la variable en otro lado)
			speed_mov_d = ceil(speed_mov * 0.75); 
		}
	}
	else
	{
		speed_mov = 0;
		speed_mov_d = 0;
	}
}

// 4. DESPLAZAMIENTO
scr_desplazamiento_p2();

// 5. RESET (CRUCIAL: Esto evita que patine infinitamente)
if(move) 
{
	// Reseteamos siempre a -1. 
	// El scr_input_p2 lo volverá a poner en su valor en el siguiente frame SI tocas el stick.
	dir_mov = -1;
}

// 6. ORIENTACIÓN Y SPRITES
switch(ori)
{
	case 0:
		if(speed_mov == 0) {
			if(att) sprite_index = s_att_right; else sprite_index = s_stand_right;
		} else sprite_index = s_walk_right;
		image_xscale = 1;
		if(instance_exists(my_mask)) { my_mask.x = x + 36; my_mask.y = y + 16; }
	break;
	
	case 90:
		if(speed_mov == 0) {
			if(att) sprite_index = s_att_up; else sprite_index = s_stand_up;
		} else sprite_index = s_walk_up;
		image_xscale = 1;
		if(instance_exists(my_mask)) { my_mask.x = x; my_mask.y = y - 33; }
	break;
	
	case 180:
		if(speed_mov == 0) {
			if(att) sprite_index = s_att_right; else sprite_index = s_stand_right;
		} else sprite_index = s_walk_right;
		image_xscale = -1;
		if(instance_exists(my_mask)) { my_mask.x = x - 36; my_mask.y = y + 16; }
	break;
	
	case 270:
		if(speed_mov == 0) {
			if(att) sprite_index = s_att_down; else sprite_index = s_stand_down;
		} else sprite_index = s_walk_down;
		image_xscale = 1;
		if(instance_exists(my_mask)) { my_mask.x = x; my_mask.y = y + 53; }
	break;
}

if(instance_exists(my_mask)) my_mask.image_angle = ori;
mask_index = s_player_mask;

if(invi > 0) { invi -= 1; image_alpha = 0.75; } else { image_alpha = 1; }
depth = - (y+20);