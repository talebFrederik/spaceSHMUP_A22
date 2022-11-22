extends Node

signal enemy_died()
signal player_died()

var Level1 = preload("res://scenes/Level1.tscn")
var Level2 = preload("res://scenes/Level2.tscn")

func _ready():
	var level1 = Level1.instance()
	add_child(level1)

func _process(_delta):
	pass

func _on_Main_enemy_died():
	pass # Replace with function body.
