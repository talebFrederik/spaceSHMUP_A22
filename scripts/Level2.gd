extends Node2D

onready var spawnTimer = $SpawnTimer
onready var spawners = [$EnemyWave, $EnemyWave2]

func _ready():
	spawnTimer.start()

func _on_SpawnTimer_timeout():
	spawners[randi()%2]._sendWave()
	var newInterval = randi() % 5 + 1
	spawnTimer.wait_time = newInterval
	spawnTimer.start()
