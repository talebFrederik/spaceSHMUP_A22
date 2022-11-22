extends Node2D

var BioFighter = preload("res://scenes/BioFighter.tscn")
onready var spawns = [$spawn0, $spawn1, $spawn2]

func _ready():
	pass

func _sendWave():
	for spawn in spawns:
		var bioFighter = BioFighter.instance()
		bioFighter._spawn(spawn.global_position)
		get_parent().add_child(bioFighter)
