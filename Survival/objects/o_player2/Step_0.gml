// --- DEATH ---
if(hp <= 0 and !dead)
{
	dead = 1;
	move = 0; 
	dir_mov = -1;
	speed_mov = 0; 
	speed_mov_d = 0; 
	att = 0; 
	invi = 999;
	
	visible = 0; // Se vuelve invisible
	instance_create_depth(x,y,depth-300,o_blood);
	alarm[1] = 100;
	
	// Ya no tocamos la máscara aquí
}

// =========================================================
// --- FRENO DE SEGURIDAD ---
// Si está muerto, cortamos el código aquí.
// Esto evita que se mueva, que se desplace o que el alpha cambie.
if (dead) exit;
// =========================================================


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
	if(dir_mov != -1)
	{
		if(speed_mov < speed_max)
		{
			speed_mov += accel;
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

// 5. RESET
if(move) 
{
	dir_mov = -1;
}

// 6. ORIENTACIÓN Y SPRITES
switch(ori)
{
	case 0: // DERECHA
		if(speed_mov == 0) {
			if(att) sprite_index = s_att_right; else sprite_index = s_stand_right;
		} else sprite_index = s_walk_right;
		image_xscale = 1;
		o_inter_mask_p2.x = x + 36; 
		o_inter_mask_p2.y = y + 16;
	break;
	
	case 90: // ARRIBA
		if(speed_mov == 0) {
			if(att) sprite_index = s_att_up; else sprite_index = s_stand_up;
		} else sprite_index = s_walk_up;
		image_xscale = 1;
		o_inter_mask_p2.x = x; 
		o_inter_mask_p2.y = y - 33; 
	break;

	case 180: // IZQUIERDA
		if(speed_mov == 0) {
			if(att) sprite_index = s_att_right; else sprite_index = s_stand_right;
		} else sprite_index = s_walk_right;
		image_xscale = -1;
		o_inter_mask_p2.x = x - 36; 
		o_inter_mask_p2.y = y + 16; 
	break;

	case 270: // ABAJO
		if(speed_mov == 0) {
			if(att) sprite_index = s_att_down; else sprite_index = s_stand_down;
		} else sprite_index = s_walk_down;
		image_xscale = 1;
		o_inter_mask_p2.x = x; 
		o_inter_mask_p2.y = y + 53; 
	break;
}

o_inter_mask_p2.image_angle = ori;
mask_index = s_player_mask;

// Al poner el "exit" arriba, este código ya no corre cuando está muerto,
// así que no te cambia el alpha a 0.75 forzosamente.
if(invi > 0) { invi -= 1; image_alpha = 0.75; } else { image_alpha = 1; }
depth = - (y+20);