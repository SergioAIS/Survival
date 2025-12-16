function scr_skeleton_shoot()
{
    can_shoot = false;
    alarm[2] = shoot_cooldown;

    bullet_dir = point_direction(x, y, o_player.x, o_player.y);
    
    arrow_instance = instance_create_layer(x, y, "Instances", o_arrow);

    arrow_instance.direction = bullet_dir;
    arrow_instance.speed = 6; 
    arrow_instance.image_angle = bullet_dir;
    arrow_instance.dmg = dmg;
    
    // Añadir sonido de disparo
}