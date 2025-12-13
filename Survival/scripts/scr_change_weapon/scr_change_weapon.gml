// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_change_weapon(argument0){
	// Afecta a la instancia que llama al script
    switch(argument0)
    {
        case "axe":
            weapon = "axe";
            s_att_right = s_axe_right;
            s_att_up = s_axe_up;
            s_att_down = s_axe_down;
        break;
        
        case "fire":
            weapon = "fire";
            s_att_right = s_use_right;
            s_att_up = s_use_up;
            s_att_down = s_use_down;
        break;      
    }
}