extends Node2D

onready var spawnTimer = $SpawTimer
onready var spawner = $EnemyWave

func _ready():
	spawnTimer.start()

func _on_SpawTimer_timeout():
	spawner._sendWave()
	var newInterval = randi() % 5 + 1
	spawnTimer.wait_time = newInterval
	spawnTimer.start()
	
