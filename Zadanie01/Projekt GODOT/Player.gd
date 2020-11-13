extends Area2D

signal attacked
signal hit_by_projectile
signal killed_enemy

var canAttack = false
var target
var enemyScene

func _ready():
	enemyScene = load("res://Enemy.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	RotateToMouse()

func _unhandled_input(event):
	if Input.is_action_just_pressed("rightClick"):
		TeleportToMouse()
	if Input.is_action_just_pressed("leftClick"):
		Attack()

func RotateToMouse():
	look_at(get_viewport().get_mouse_position())


func TeleportToMouse():
	var mousePosition = get_viewport().get_mouse_position()
	position = mousePosition

func Attack():
	if canAttack:
		target = $Katana.GetTarget()
		target.Die()
		emit_signal("killed_enemy")
		canAttack = false


func _on_Player_body_entered(body):
	emit_signal("hit_by_projectile")


func _on_Katana_canAttack():
	canAttack = true


func _on_Katana_cantAttack():
	canAttack = false
