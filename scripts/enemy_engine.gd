extends Node

var enemies = [4, 4, 4, 4, 4]  # Quantidade inicial de inimigos em cada posição

func spawnEnemy(position: int):
	if enemies[position] > 0:
		enemies[position] -= 1
		# Aqui você pode criar o objeto de inimigo na posição especificada

func eliminateEnemy(position: int):
	if enemies[position] == 0:
		return
	enemies[position] = 0
	# Aqui você pode destruir o objeto de inimigo na posição especificada

