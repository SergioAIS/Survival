// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_desplazamiento(){
	
	// Si no hay dirección definida, no hacemos nada
	if (dir_mov == -1) exit;

	// 1. Calcular cuánto nos queremos mover en X y en Y
	// lengthdir_x(distancia, angulo) nos da el componente horizontal
	var _move_x = lengthdir_x(speed_mov, dir_mov);
	var _move_y = lengthdir_y(speed_mov, dir_mov);

	// 2. Movimiento Horizontal (X)
	// Si nos vamos a mover en X
	if (_move_x != 0)
	{
		// Usamos 0 (derecha) o 180 (izquierda) para la dirección de contacto
		var _dir_x = (_move_x > 0) ? 0 : 180;
		// Moverse solo la cantidad absoluta necesaria
		move_contact_solid(_dir_x, abs(_move_x));
	}

	// 3. Movimiento Vertical (Y)
	// Si nos vamos a mover en Y
	if (_move_y != 0)
	{
		// Usamos 270 (abajo) o 90 (arriba)
		var _dir_y = (_move_y > 0) ? 270 : 90;
		move_contact_solid(_dir_y, abs(_move_y));
	}
	
	// NOTA: Ya no actualizamos 'ori' aquí, eso lo hace scr_input
}