extends Node2D


var missionText = "Don't rescue anyone, grab the diamond"
var firstObjectiveGot = false

func _ready():
	$nameLabel.text = "Agent \"" + PersistentData.playerName + "\""
	$missionLabel.text = missionText
	PersistentData.lastPlayedLevel = "res://Level02.tscn"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func PlayerEnteredHazard():
	if not $Player.eyesClosed:
		GameOver()
		
func GameOver():
	get_tree().change_scene("res://GameOverScreen.tscn")


func _on_hazard_playerEnteredHazard():
	PlayerEnteredHazard() 


func _on_hazard2_playerEnteredHazard():
	PlayerEnteredHazard() 


func _on_hazard3_playerEnteredHazard():
	PlayerEnteredHazard() 


func _on_firstObjective_playerEnteredObjective():
	$diamond.hide()
	firstObjectiveGot = true
	$missionLabel.text = "Ok, now escape"
	
	
func _on_exitObjective_playerEnteredObjective():
	if firstObjectiveGot:
		get_tree().change_scene("res://WinScreen.tscn")
	else:
		$missionLabel.text = "Grab the diamond first."


func _on_prisoner1Objective_playerEnteredObjective():
	$missionLabel.text = "Where did he go?"
	$manBrown_stand.hide()
	PersistentData.numOfSecrets += 1


func _on_prisoner2Objective2_playerEnteredObjective():
	$missionLabel.text = "Where did he go?"
	$manBrown_stand2.hide()
	PersistentData.numOfSecrets += 1
