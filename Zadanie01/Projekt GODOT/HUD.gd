extends CanvasLayer

signal buttonPressed
signal newGameButtonPressed

var newGame = true

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

func GameStart():
	$TryAgainButton.disabled = false
	$Instructions.hide()
	$TitleLabel.hide()
	$"Life Label".show()
	$"Score Label".show()
	$NewGameButton.queue_free()
	$MenuMusic.stop()


func _on_TryAgainButton_pressed():
	emit_signal("buttonPressed")


func _on_NewGameButton_pressed():
	GameStart()
	emit_signal("newGameButtonPressed")
