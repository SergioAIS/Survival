if (invi == 0 and other.dmg != 0)
{
	hp -= other.dmg
	invi = invi_max
	
	move = 0
	att = 0
	if (instance_exists(o_att_melee))
	{
		instance_destroy(o_att_melee)
	}
	
	dir_mov = point_direction(other.x, other.y, x, y)
	speed_mov = collision_speed
	alarm[0] = collision_time
}