extends Node


var sayHello = "Hello hello"

var names = ["Jan", "John", "Juan"]

# Called when the node enters the scene tree for the first time.
func _ready():
	print(sayHello)
	print(names[1])


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	print("Hello World")
