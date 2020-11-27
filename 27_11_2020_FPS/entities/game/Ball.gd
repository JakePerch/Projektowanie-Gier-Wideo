extends RigidBody

signal collidedWithGate
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#CheckIfInGate()
	pass

func CheckIfInGate():
	var collidingBodies = get_colliding_bodies()
	for body in collidingBodies:
		if body.c == 'Gate':
			print("goal")
			

func _on_Ball_body_entered(body):
	#if body.get_name() == "Gate":
	print("goal")
