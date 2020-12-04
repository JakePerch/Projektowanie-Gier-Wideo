extends RigidBody

var points = 100

func _ready():
	print(points)

func _physics_process(delta):
	CheckIfInGate()
	#na zderzenie z gate przeniesc kulke do spawnpointu

func CheckIfInGate():
	var collidingBodies = get_colliding_bodies()
	for body in collidingBodies:
		if body.get_name() == "Gate":
			points += 1
			print(points)

func _on_Timer_timeout():
	points -= 5
	print(points)
