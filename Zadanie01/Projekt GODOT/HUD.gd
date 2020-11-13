extends CanvasLayer

signal buttonPressed

func _ready():
	pass # Replace with function body.

func GameOverLabelActive(value):
	if value:
		$"Game Over Label".show()
		$TryAgainButton.show()
	else:
		$"Game Over Label".hide()
		$TryAgainButton.hide()

func UpdateLifeLabel(value):
	$"Life Label".text = "Lifes: " + str(value)
	
func UpdateScoreLabel(value):
	$"Score Label".text = "Score: " + str(value)


func _on_TryAgainButton_pressed():
	emit_signal("buttonPressed")
