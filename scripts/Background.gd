extends CanvasLayer


export var startPosX = 0
export var speed = 10

onready var bg = [$Sprite, $Sprite2, $Sprite3]

var startPosY = -750

func _ready():
	var posX = startPosX
	var posY = startPosY
	
	for screen in bg:
		screen.position.x = posX
		screen.position.y = posY
		posY += 1500
		

func _physics_process(delta):
	for screen in bg:
		screen.position.y += speed
		if screen.position.y >= 2250:
			screen.position.y = startPosY 
