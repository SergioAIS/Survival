surface_set_target(surf)
draw_clear_alpha(c_black,0)
 
draw_set_color(c_black)
draw_set_alpha(0.9)
draw_rectangle(0,0,room_width,room_height,0)
 
gpu_set_blendmode(bm_subtract)
 
with(o_player)
draw_sprite_ext(s_light,0,x,y,5,5,0,c_white,1)

with(o_att)
draw_sprite_ext(s_light,0,x,y,2,2,0,c_white,1)
 
with(o_enemy_body)
draw_sprite_ext(s_light,0,x,y,3,3,0,c_white,1)

with (o_pot)
draw_sprite_ext(s_light,0,x,y,2,2,0,c_white,1)

with (o_float_text)
draw_sprite_ext(s_light,0,x,y,2,2,0,c_white,1)

//with(o_enemy_att)
//draw_sprite_ext(s_light,0,x,y,2,2,0,c_white,1)
 
//with(o_light)
//draw_sprite_ext(s_light,0,x,y,4,4,0,c_white,1)

 
gpu_set_blendmode(bm_normal)
 
surface_reset_target()

 
draw_surface(surf,0,0)