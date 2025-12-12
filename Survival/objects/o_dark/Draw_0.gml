// Check de seguridad por si la surface se pierde (pasa al minimizar ventanas)
if (!surface_exists(surf)) {
    surf = surface_create(room_width, room_height);
}

surface_set_target(surf);
draw_clear_alpha(c_black, 0);

// --- AQUÍ ESTÁ EL CAMBIO ---
draw_set_color(current_color); // Usamos el color calculado (Naranja/Azul/Negro)
draw_set_alpha(current_alpha); // Usamos el alpha calculado (0 a 0.95)
draw_rectangle(0, 0, room_width, room_height, 0);
// ---------------------------

gpu_set_blendmode(bm_subtract);

// ... (Todo tu código de luces sigue igual aquí: with(o_player)... etc) ...
with(o_player) draw_sprite_ext(s_light,0,x,y,5,5,0,c_white,1);
with(o_att) draw_sprite_ext(s_light,0,x,y,2,2,0,c_white,1);
with(o_enemy_body) draw_sprite_ext(s_light,0,x,y,3,3,0,c_white,1);
//with(o_pot) draw_sprite_ext(s_light,0,x,y,2,2,0,c_white,1);
with(o_float_text) draw_sprite_ext(s_light,0,x,y,2,2,0,c_white,1);

gpu_set_blendmode(bm_normal);

surface_reset_target();

draw_surface(surf, 0, 0);

// Es buena práctica resetear alpha y color al final para no afectar otros draws
draw_set_alpha(1);
draw_set_color(c_white);