extends KinematicBody2D

export var speed = 500
export var cooldown = 0.2
export var fixed = false
var velocity = Vector2()


func _shoot(pos):
	position = pos
	velocity = Vector2(0,-speed)

func _physics_process(delta):
	move_and_collide(velocity * delta)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
