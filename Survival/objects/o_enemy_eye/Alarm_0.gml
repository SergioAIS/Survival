// @description Ejecutar Ataque y Cooldown
if (state == E_EYE_STATE.ATTACK)
{
    if (distance_to_object(o_player) < attack_distance)
    {
        o_player.hp -= dmg; 
    }
    
    can_attack = false;
    alarm[1] = attack_cooldown;
}