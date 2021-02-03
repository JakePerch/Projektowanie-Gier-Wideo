extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var gameOverText = "Agent \"" + PersistentData.playerName + "\" has been terminated."
	$Panel/MarginContainer/VBoxContainer/gameOverLabel.text = gameOverText
	


func _on_startFromLastButton_pressed():
	get_tree().change_scene(PersistentData.lastPlayedLevel)


func _on_backToMenuButton_pressed():
	get_tree().change_scene("res://MainMenu.tscn")
