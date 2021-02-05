extends Node2D


var missionText = "Use the corridor on your left."

func _ready():
	$nameLabel.text = "Agent \"" + PersistentData.playerName + "\""
	$missionLabel.text = missionText


func PlayerEnteredHazard():
	if not $Player.eyesClosed:
		GameOver()
		
func GameOver():
	get_tree().change_scene("res://GameOverScreen.tscn")

func _on_hazard_playerEnteredHazard():
	PlayerEnteredHazard() 


func _on_hazard2_playerEnteredHazard():
	PlayerEnteredHazard() 


func _on_objective_playerEnteredObjective():
	get_tree().change_scene("res://Level02.tscn")


func _on_objective2_playerEnteredObjective():
	$missionLabel.text = "How did you get that?"
	$sideObjective.hide()
	PersistentData.numOfSecrets += 1
