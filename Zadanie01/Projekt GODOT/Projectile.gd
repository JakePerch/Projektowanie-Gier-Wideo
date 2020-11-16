extends RigidBody2D

var projectileSpeed = 1000
var timeToDestroy = 10 as float

# Called when the node enters the scene tree for the first time.
func _ready():
	$DestroyTimer.set_wait_time(timeToDestroy)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):

func _on_DestroyTimer_timeout():
	get_parent().remove_child(self)

func Fly(rotation):
	linear_velocity = Vector2(projectileSpeed, 0)
	linear_velocity = linear_velocity.rotated(rotation)
	
func SetSpeed(speed):
	projectileSpeed = speed


func _on_Projectile_body_entered(body):
	print("projectile hit sth")

func Destroy():
	get_parent().remove_child(self)
