extends Node2D

signal finished()

onready var spawnTimer = $SpawnTimer
onready var spawners = [$EnemyWave, $EnemyWave2]
export var waveCount = 1
var wave = 0

func _ready():
	print("lvl2")
	spawnTimer.start()

func _on_SpawnTimer_timeout():
	spawnTimer.stop()
	if wave < waveCount:
		spawners[randi()%2]._sendWave()
		wave += 1
		var newInterval = randi() % 5 + 1
		spawnTimer.wait_time = newInterval
		spawnTimer.start()
	else:
		emit_signal("finished")

