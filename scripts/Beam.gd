extends KinematicBody2D


export var speed = 500
export var cooldown = 6
export var fixed = true
var velocity = Vector2()

func _shoot(pos):
	position = pos
	$AnimationPlayer.play("Fire")


func _on_AnimationPlayer_animation_finished(_anim_name):
	queue_free()
