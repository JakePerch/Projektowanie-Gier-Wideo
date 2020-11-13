extends Area2D

var shotFrequency = 3 as float
var shotSpeed = 500
var projectileScene
var alive = true
var timeForBodyRemoval = 7 as float

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play()
	$ShotTimer.set_wait_time(shotFrequency)
	$RemovalTimer.set_wait_time(timeForBodyRemoval)
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

func Die():
	alive = false
	get_node("CollisionShape2D").disabled = true
	$ShotTimer.stop()
	$AnimatedSprite.play("die")
	$RemovalTimer.start()


func _on_RemovalTimer_timeout():
	queue_free()
