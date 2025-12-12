// --- DEATH ---
if(hp <= 0 and !dead)
{
	dead = 1;
	move = 0;
	speed_mov = 0;
	att = 0;
	alarm[0] = -1;
	visible = 0;
	instance_create_depth(x,y,depth-300,o_blood);
	alarm[1] = 100;
	exit; // Dejamos de ejecutar el resto del código si muere
}

if (dead) exit; // Seguridad extra

// --- INPUT ---
// Llamamos al input SIEMPRE primero. Él decide si 'move' es 1 o 0.
scr_input();

// --- ATAQUE ---
// scr_input ya puso 'att' en 1 si presionamos el botón.
if (att == 1 and weapon != "")
{
	speed_mov = 0; 
	move = 0;      
	
	// Ejecutamos la creación del proyectil/hitbox
	// IMPORTANTE: Solo lo hacemos si acabamos de empezar la animación (frame 0)
	// para no crear 60 hachas por segundo.
	if (image_index < 1) scr_att();
	
	// NO ponemos att = 0 aquí. Dejamos que la animación corra.
}

// --- VELOCIDAD ---

if (move)
{
	// Aceleramos hasta el máximo
	if (speed_mov < speed_max)
	{
		speed_mov += accel;
	}
}
else
{
	// FRENADO
	// Si quieres que pare INSTANTÁNEAMENTE (como antes):
	speed_mov = 0;
	
	// Si prefieres que tenga un poquito de desaceleración suave:
	/*
	if (speed_mov > 0) {
		speed_mov -= accel * 2; // Frena rápido
		if (speed_mov < 0) speed_mov = 0;
	}
	*/
}

// --- DESPLAZAMIENTO (Física) ---
scr_desplazamiento();


// --- ANIMACIÓN Y ORIENTACIÓN ---
// Convertimos el ángulo 'ori' (que ahora puede ser 360) a 4 direcciones simples
// para elegir el sprite correcto (0, 90, 180, 270)

var _visual_ori = round(ori / 90) * 90;
if (_visual_ori == 360) _visual_ori = 0;

// Máscara de interacción
o_inter_mask.image_angle = _visual_ori;
mask_index = s_player_mask;

switch(_visual_ori)
{
	case 0: // Derecha
		sprite_index = (speed_mov > 0) ? s_walk_right : s_stand_right;
		// Si estuvieras atacando, podrías cambiar el sprite aquí también
		image_xscale = 1;
		o_inter_mask.x = x + 36; o_inter_mask.y = y + 16;
	break;
	
	case 90: // Arriba
		sprite_index = (speed_mov > 0) ? s_walk_up : s_stand_up;
		image_xscale = 1;
		o_inter_mask.x = x; o_inter_mask.y = y - 33;
	break;
	
	case 180: // Izquierda
		sprite_index = (speed_mov > 0) ? s_walk_right : s_stand_right;
		image_xscale = -1; // Espejo
		o_inter_mask.x = x - 36; o_inter_mask.y = y + 16;
	break;
	
	case 270: // Abajo
		sprite_index = (speed_mov > 0) ? s_walk_down : s_stand_down;
		image_xscale = 1;
		o_inter_mask.x = x; o_inter_mask.y = y + 53;
	break;
}

// Control de invencibilidad y depth
if(invi > 0) {
	invi -= 1;
	image_alpha = 0.75;
} else {
	image_alpha = 1;
}

depth = - (y+20);