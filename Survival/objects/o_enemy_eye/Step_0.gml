event_inherited();

switch (state)
{
    case E_EYE_STATE.IDLE:
        sprite_index = s_eye_fly;
        image_speed = 0;
        
        if (distance_to_object(o_player) < range)
        {
            state = E_EYE_STATE.FLY;
            image_speed = 1;
        }
    break;
    
    case E_EYE_STATE.FLY:
        dir_mov = point_direction(x, y, o_players.x, o_players.y);
        move_contact_solid(dir_mov, speed_max);
        
        sprite_index = s_eye_fly;
        if (o_players.x > x) {
            image_xscale = 1;
        } else {
            image_xscale = -1;
        }
        
        if (distance_to_object(o_players) < attack_distance and can_attack)
        {
            state = E_EYE_STATE.ATTACK;
            speed = 0;
        }
    break;
    
    case E_EYE_STATE.ATTACK:
        sprite_index = s_eye_attack;
        image_speed = 1;
        
        if (image_index >= image_number - 1)
        {
            state = E_EYE_STATE.FLY;
        }
        
    break;
    
    case E_EYE_STATE.HIT:
        sprite_index = s_eye_hit;
        image_speed = 1;
        
        if (invi <= 0)
        {
            state = E_EYE_STATE.FLY;
            image_speed = 1;
        }
    break;
    
    case E_EYE_STATE.DEAD:
        sprite_index = s_eye_death;
        image_speed = 1;
        if (image_index >= image_number - 1)
        {
            instance_destroy();
        }
    break;
}

depth = -(y + 8);

if (state != E_EYE_STATE.DEAD)
{
    if (invi > 0)
    {
        invi--;
    }
}