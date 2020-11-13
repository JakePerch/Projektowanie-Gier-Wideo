extends Area2D

var shotFrequency = 3 as float
var shotSpeed = 500
var projectileScene

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play()
	$ShotTimer.set_wait_time(shotFrequency)
	projectileScene = load("res://Projectile.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#called by ShotTimer:
func _on_Timer_timeout():
	Shoot()

func Shoot():
	var projectile = projectileScene.instance()
	add_child(projectile)
	projectile.SetSpeed(shotSpeed)
	projectile.Fly(rotation)
