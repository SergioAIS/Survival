event_inherited();

if (ice)
{
	speed_max = 1.5
	alarm[3] = 180
}
else speed_max = 3

dist_to_player = point_distance(x, y, o_player.x, o_player.y);

if (dist_to_player > min_distance)
{
    dir_mov = point_direction(x, y, o_player.x, o_player.y);
    move = 1;
    
    sprite_index = s_skeleton_right;
}
else if (dist_to_player <= attack_range)
{
    move = 0;
    
    angle_to_player = point_direction(x, y, o_player.x, o_player.y);
    dir_animacion = (round((angle_to_player + 45) / 90) % 4) * 90;
    
    switch(dir_animacion)
    {
        case 0:  sprite_index = s_skeleton_right; image_xscale = 1; break;
        case 90: sprite_index = s_skeleton_up;    image_xscale = 1; break;
        case 180:sprite_index = s_skeleton_right; image_xscale = -1; break;
        case 270:sprite_index = s_skeleton_down;  image_xscale = 1; break;
    }
    
    if (can_shoot)
    {
        scr_skeleton_shoot(); 
    }
}
else
{
    move = 0;
}

if(move)
{
	move_contact_solid(dir_mov,speed_max);
    dir_animacion = (round((dir_mov + 45) / 90) % 4) * 90; 
	
	switch(dir_animacion)
	{
		case 0:
			sprite_index = s_skeleton_right;
			image_xscale = 1;
		break;
		
		case 90:
			sprite_index = s_skeleton_up;
			image_xscale = 1;
		break;
		
		case 180:
			sprite_index = s_skeleton_right;
			image_xscale = -1;
		break;
		
		case 270:
			sprite_index = s_skeleton_down;
			image_xscale = 1;
		break;
	}

	mask_index = s_skeleton_mask;
}
else
{
	image_index = 0;
	if(is_hit)
	{
		move_contact_solid(dir_mov,speed_max);
	}
}

depth = -(y+20);