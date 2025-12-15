// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_set_global(_nuevo_valor){
	// 1. Verificar si hubo cambio real (opcional, para no spamear si es el mismo valor)
	if (global.previous_room != _nuevo_valor)
	{
		var _valor_anterior = global.previous_room;
		
		// 2. Asignar el nuevo valor
		global.previous_room = _nuevo_valor;
		
		// 3. OBTENER EL CULPABLE (La magia)
		// debug_get_callstack() devuelve un array con la lista de scripts ejecutándose.
		// El índice [1] es quien llamó a esta función.
		var _stack = debug_get_callstack();
		var _culpable = "Desconocido";
		
		if (array_length(_stack) > 1) {
			_culpable = _stack[1]; // Ejemplo: "gml_Object_o_player_Step_0 (line 24)"
		}

		// 4. IMPRIMIR EN CONSOLA
		var _mensaje = "--------------------------------------------------\n";
		_mensaje += "⚠️ CAMBIO DETECTADO\n";
		_mensaje += "Anterior: " + string(_valor_anterior) + "  -->  Nuevo: " + string(_nuevo_valor) + "\n";
		_mensaje += "📍 Origen: " + string(_culpable) + "\n";
		_mensaje += "--------------------------------------------------";
		
		show_debug_message(_mensaje);
	}
}