extends KinematicBody2D


export var speed = 400
var screenSize
var eyesClosed = false


# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	RotateToMouse()
	CloseEyes()

func _physics_process(delta):
	Move(delta)
	
func RotateToMouse():
	look_at(get_viewport().get_mouse_position())
	
func Move(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	move_and_collide(velocity * delta)
	
func CloseEyes():
	if Input.is_action_just_pressed("ui_rmb"):
		if not eyesClosed:
			$eyesClosedPolygon.show()
			eyesClosed = true
		else:
			$eyesClosedPolygon.hide()
			eyesClosed = false
