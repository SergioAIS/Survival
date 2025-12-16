// Verificamos si estamos en la sala correcta (Opcional, si el objeto solo está en esa sala, quita el if)
if (room == global.respawn_room)
{
	// --- RESPAWN PLAYER 1 ---
	if (instance_exists(o_player))
	{
		o_player.x = x - 32; // 32 pixeles a la izquierda
		o_player.y = y;
		
		// IMPORTANTE: Si murió, hay que revivirlo
		if (o_player.hp <= 0) o_player.hp = o_player.hp_max;
		
		// Resetear estado de movimiento (para que no aparezca atacando o rodando)
		// o_player.state = "idle"; // Descomenta si usas máquinas de estados
	}

	// --- RESPAWN PLAYER 2 ---
	if (instance_exists(o_player2))
	{
		o_player2.x = x + 32; // 32 pixeles a la derecha
		o_player2.y = y;
		
		if (o_player2.hp <= 0) o_player2.hp = o_player2.hp_max;
	}
}