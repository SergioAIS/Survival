
if(invi == 0 and other.dmg != 0)
{
	hp -= other.dmg;
	invi = invi_max;
	
	move = 0;
	
	dir_mov = point_direction(other.x,other.y,x,y);
	is_hit = 1;
	alarm[1] = hit_time;
	alarm[0] = -1;
	
	obj = instance_create_layer(x,y,"GUI",o_float_text);
	obj.value = other.dmg;
	obj.type = "att";
	
	instance_create_depth(x,y,depth-300,o_hit);
}
