extends KinematicBody

var kierunek = Vector3()
var speed = 5

func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		kierunek.x -= 1
	if Input.is_action_pressed("ui_right"):
		kierunek.x += 1
	if Input.is_action_pressed("ui_up"):
		kierunek.z -= 1
	if Input.is_action_pressed("ui_down"):
		kierunek.z += 1
	kierunek = kierunek.normalized()
	kierunek = kierunek * speed
	move_and_slide(kierunek, Vector3(0,1,0))
