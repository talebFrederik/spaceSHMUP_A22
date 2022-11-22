extends KinematicBody2D

export var speed = 100
export var rof = 1

var BioBullet = preload("res://scenes/BioBullet.tscn")

var velocity = Vector2()
var time = 0

func _ready():
	$Cooldown.wait_time = rof
	$Cooldown.start()
	rotation = deg2rad(180)

func _physics_process(delta):
	#ajouter un mouvement latéral d'oscillation
	#time += delta * 5
	#velocity = Vector2(sin(time),1)
	velocity = Vector2.DOWN
	var collision = move_and_collide(velocity * speed * delta)
	if collision:
		queue_free()
	# si on sort en bas de l'écran 
	if position.y > get_viewport_rect().size.y + 100:
		queue_free()
	
func _spawn(pos):
	position = pos

func _on_Cooldown_timeout():
	var bullet = BioBullet.instance()
	bullet._shoot($Canon.global_position, rotation - deg2rad(90))
	get_parent().add_child(bullet)
