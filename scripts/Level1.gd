extends Node2D

signal finished()

onready var spawnTimer = $SpawTimer
onready var spawner = $EnemyWave
export var waveCount = 1
var wave = 0

func _ready():
	print("lvl1")
	spawnTimer.start()

func _on_SpawTimer_timeout():
	spawnTimer.stop()
	if wave < waveCount:
		spawner._sendWave()
		wave += 1
		var newInterval = randi() % 5 + 1
		spawnTimer.wait_time = newInterval
		spawnTimer.start()
	else:
		emit_signal("finished")
	
