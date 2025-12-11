
o_player.keys += 1;

obj = instance_create_layer(x,y,"GUI",o_float_text);
obj.value = "+1 Key";
obj.type = "key";

f_used();

instance_destroy();
