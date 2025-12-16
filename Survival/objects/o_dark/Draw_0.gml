// Nota: Quité el "if (global.game_started == false) exit;" de aquí.
// ¿Por qué? Para que el sistema de luces funcione incluso antes de empezar
// (ej: ver la luz de la fogata mientras exploras antes de tomar las armas).
// Si prefieres que se vea plano, vuélvelo a poner.

// 1. GESTIÓN DE SURFACE (TAMAÑO DE ROOM)
if (!surface_exists(surf)) 
{
	surf = surface_create(room_width, room_height);
}
else 
{
	// AJUSTE POR CAMBIO DE TAMAÑO DE ROOM
	// Si la room creció y la surface quedó chica, la recreamos.
	if (surface_get_width(surf) != room_width || surface_get_height(surf) != room_height)
	{
		surface_free(surf);
		surf = surface_create(room_width, room_height);
	}
}

surface_set_target(surf);
draw_clear_alpha(c_black, 0);

// FONDO OSCURO
draw_set_color(current_color);
draw_set_alpha(current_alpha);
draw_rectangle(0, 0, room_width, room_height, 0);

// LUCES (Modo Sustractivo)
gpu_set_blendmode(bm_subtract);

// DIBUJAR LAS LUCES (Mantén tu lista actual)
with(o_player) draw_sprite_ext(s_light,0,x,y,5,5,0,c_white,1);
with(o_player2) draw_sprite_ext(s_light,0,x,y,5,5,0,c_white,1);
with(o_att) draw_sprite_ext(s_light,0,x,y,2,2,0,c_white,1);
with(o_enemy_body) draw_sprite_ext(s_light,0,x,y,3,3,0,c_white,1);
with(o_float_text) draw_sprite_ext(s_light,0,x,y,2,2,0,c_white,1);
// FOGATA: Hacemos que la luz "pulse" un poquito para que se vea viva
var _flicker = random_range(9.8, 10.2); 
with(o_fogata) draw_sprite_ext(s_light,0,x,y,_flicker,_flicker,0,c_white,1);

gpu_set_blendmode(bm_normal);
surface_reset_target();

draw_surface(surf, 0, 0);

draw_set_alpha(1);
draw_set_color(c_white);