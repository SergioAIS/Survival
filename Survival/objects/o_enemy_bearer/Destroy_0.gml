// 1. Crear la llave en el suelo
var _key = instance_create_layer(x, y, "Instances", o_key_item);

// 2. Configurar la llave (Pasarle los datos)
with(_key)
{
    color_name = other.key_to_drop;
    image_id = other.key_sprite_id;
}

// 3. Efectos de muerte normal
event_inherited();