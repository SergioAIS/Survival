
camera_x = camera_get_view_x(view_camera[0]);
camera_y = camera_get_view_y(view_camera[0]);

draw_sprite(s_HUD,0,camera_x+40,camera_y+28);

draw_set_color(make_color_rgb(244,67,54));
draw_set_font(f_float_text);
draw_set_halign(fa_left);
draw_text(camera_x+123,camera_y+50,o_player.hp);

draw_set_color(c_white);
draw_text(camera_x+123,camera_y+100,o_player.keys);
