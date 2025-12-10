if (move)
{	
	
	//Input
	
	scr_input()
	
	if (keyboard_check(vk_control) and weapon != "")
	{
		dir_mov = -1
		att = 1
		move = 0
		
		scr_att()
	}
	
	//Speed
	
	if (dir_mov != -1)
	{
		if (speed_mov < speed_max)
		{
			speed_mov += accel
			speed_mov_d = ceil(speed_mov * 0.75)
		}
	}
	else
	{
		speed_mov = 0	
		speed_mov_d = 0
	}
}

//Desplazamiento

scr_desplazamiento()

//Resets

if (move) dir_mov = -1

//Orientación


switch(ori)
{
	case 0:
		if (speed_mov == 0) 
		{
			if (att)
			{
				sprite_index = s_axe_right
			}
			else
			{
				sprite_index = s_stand_right
			}
		}
		else sprite_index = s_walk_right
		image_xscale = 1
		
		o_inter_mask.x = x + 36
		o_inter_mask.y = y + 10
	break;
		
	case 90:
		if (speed_mov == 0) 
		{
			if (att)
			{
				sprite_index = s_axe_up
			}
			else
			{
				sprite_index = s_stand_up
			}
		}
		else sprite_index = s_walk_up
		image_xscale = -1
		
		o_inter_mask.x = x
		o_inter_mask.y = y - 33
	break;
	
	case 180:
		if (speed_mov == 0) 
		{
			if (att)
			{
				sprite_index = s_axe_right
			}
			else
			{
				sprite_index = s_stand_right
			}
		}
		else sprite_index = s_walk_right
		image_xscale = -1
		
		o_inter_mask.x = x - 36
		o_inter_mask.y = y - 10
	break;
	
	case 270:
		if (speed_mov == 0) 
		{
			if (att)
			{
				sprite_index = s_axe_down
			}
			else
			{
				sprite_index = s_stand_down
			}
		}
		else sprite_index = s_walk_down
		image_xscale = 1
		
		o_inter_mask.x = x
		o_inter_mask.y = y + 53
	break;
}

o_inter_mask.image_angle = ori

mask_index = s_player_mask

//Control
if (invi > 0)
{
	invi -= 1
	image_alpha = 0.6
}
else
{
	image_alpha = 1
}