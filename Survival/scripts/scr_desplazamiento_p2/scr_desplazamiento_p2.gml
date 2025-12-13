// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_desplazamiento_p2()
{
	// Si no hay dirección, salimos para evitar bugs
	if (dir_mov == -1) exit;

	// 1. MOVIMIENTO SUAVE (Sin Teletransportes)
	// Calculamos cuánto movernos en X y en Y por separado
	var _move_x = lengthdir_x(speed_mov, dir_mov);
	var _move_y = lengthdir_y(speed_mov, dir_mov);
	
	// Aplicamos movimiento en X
	// (Usamos abs para la distancia y 0/180 para la dirección de choque)
	if (_move_x != 0) {
		var _dir_check = (_move_x > 0) ? 0 : 180;
		move_contact_solid(_dir_check, abs(_move_x));
	}
	
	// Aplicamos movimiento en Y
	if (_move_y != 0) {
		var _dir_check = (_move_y > 0) ? 270 : 90;
		move_contact_solid(_dir_check, abs(_move_y));
	}
	
	// 2. CORRECCIÓN DE SPRITES (La Clave)
	// Solo actualizamos 'ori' si estamos caminando en una dirección cardinal (Recta).
	// Si es diagonal (ej: 45), mantenemos el 'ori' anterior para que se vea el sprite de lado o espalda.
	
	// Redondeamos para saber si es cardinal exacto
	var _dir_check = round(dir_mov);
	
	if (_dir_check == 0 || _dir_check == 90 || _dir_check == 180 || _dir_check == 270 || _dir_check == 360)
	{
		ori = _dir_check;
		if (ori == 360) ori = 0;
	}
}