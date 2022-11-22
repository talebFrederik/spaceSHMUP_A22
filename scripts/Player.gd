extends KinematicBody2D

# variable déterminant la vitesse
# exportée pour pouvoir la modifier dans l'éditeur
export var speed : int = 300
# variables pour instancier les armes
var Vulcan = preload("res://scenes/Vulcan.tscn")
var Beam = preload("res://scenes/Beam.tscn")
# variable pour les armes disponibles
var Weapons = [Vulcan, Beam]
var selectedWeapon = 0
# variable pour espacer les tirs
var cannonsReady = true

# variable contenant le vecteur final de déplacement
var velocity = Vector2();


func _ready():
	pass

func _process(_delta):
	pass

func _physics_process(delta):
	# gestion des entrées de l'utilisateur
	getInput()
	# gestion de l'apparence du joueur
	animate()
	# déplacement
	var collision = move_and_collide(velocity * speed * delta)
	# contact avec une balle ou un ennemi
	if collision:
		queue_free()

# getInput
# 
# Selon les entrées de l'utilisateur
# - modifie les variable de déplacement 
# - active les armes
func getInput():
	velocity = Vector2()
	if Input.is_action_pressed("up"):
		velocity.y += -1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x += -1
		
	if Input.is_action_pressed("primary") and cannonsReady:
		cannonsReady = false
		
		var leftBullet = Weapons[selectedWeapon].instance()
		var rightBullet = Weapons[selectedWeapon].instance()
		$CannonCooldown.wait_time = leftBullet.cooldown
		$CannonCooldown.start()
		
		if leftBullet.fixed:
			leftBullet._shoot($LeftCannon.position)
			rightBullet._shoot($RightCannon.position)
			add_child(leftBullet)
			add_child(rightBullet)
		else:
			leftBullet._shoot($LeftCannon.global_position)
			rightBullet._shoot($RightCannon.global_position)
			get_parent().add_child(leftBullet)
			get_parent().add_child(rightBullet)
		
	if Input.is_action_pressed("secondary"):
		pass
		
	if Input.is_action_just_pressed("weapon_swap"):
		selectedWeapon = (selectedWeapon + 1) % Weapons.size()
		print(selectedWeapon)
		
		 
		
	velocity = velocity.normalized()

func animate():
	if velocity == Vector2.ZERO:
		$Visual.play("default")
	elif velocity == Vector2.UP or velocity == Vector2.DOWN:
		$Visual.play("default")
	elif velocity == Vector2.LEFT:
		$Visual.set_flip_h(false)
		$Visual.play("Left")
	elif velocity == Vector2.RIGHT:
		$Visual.play("Right")
		$Visual.set_flip_h(true)
		
func _on_CannonCooldown_timeout():
	cannonsReady = true
