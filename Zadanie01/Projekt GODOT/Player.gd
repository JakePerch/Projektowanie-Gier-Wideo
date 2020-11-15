extends Area2D

signal hit_by_projectile
signal killed_enemy

var attackEffectTime = 0.1 as float

var canAttack = false
var target
var enemyScene
var active = false
var attackReady = false


func _ready():
	enemyScene = load("res://Enemy.tscn")
	$AttackEffectTimer.set_wait_time(attackEffectTime)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	RotateToMouse()

func _unhandled_input(event):
	if active:
		if Input.is_action_just_pressed("rightClick"):
			TeleportToMouse()
		elif Input.is_action_just_pressed("leftClick"):
			Attack()

func RotateToMouse():
	if active:
		look_at(get_viewport().get_mouse_position())


func TeleportToMouse():
	var mousePosition = get_viewport().get_mouse_position()
	position = mousePosition
	attackReady = true

func Attack():
	if attackReady:
		$Sprite/AttackEffect.show()
		$AttackEffectTimer.start()
		attackReady = false
		if canAttack:
			target.Die()
			emit_signal("killed_enemy")
			canAttack = false
			attackReady = false
		


func _on_Player_body_entered(body):
	emit_signal("hit_by_projectile")


func _on_Katana_canAttack():
	target = $Katana.GetTarget()
	canAttack = true


func _on_Katana_cantAttack():
	canAttack = false

func Active(value):
	active = value


func _on_AttackEffectTimer_timeout():
	$Sprite/AttackEffect.hide()
