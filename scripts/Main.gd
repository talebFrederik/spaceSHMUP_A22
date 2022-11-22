extends Node

signal enemy_died()
signal player_died()
signal level_finished()

var levels = [preload("res://scenes/Level1.tscn"),preload("res://scenes/Level2.tscn")]
var current_level = 0
var current_level_node

func _ready():
	current_level_node = levels[current_level].instance()
	current_level_node.connect("finished",self,"_on_Level_Finished")
	add_child(current_level_node)

func _process(_delta):
	pass

func _on_Level_Finished():
	var next_level = (current_level + 1) % levels.size()
	var next_level_node = levels[next_level].instance()
	current_level = next_level
	
	next_level_node.connect("finished", self, "_on_Level_Finished")
	current_level_node.queue_free()
	add_child(next_level_node)
	current_level_node = next_level_node
	

	
