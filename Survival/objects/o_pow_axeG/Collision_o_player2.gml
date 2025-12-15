with(other)scr_change_weapon_p2("axe")
o_player2.pick_axe = 1;
	obj = instance_create_layer(x, y, "GUI", o_float_text)
	obj.type = "att"
	obj.value = "You got a Glowing Axe!"
scr_used();
instance_destroy()