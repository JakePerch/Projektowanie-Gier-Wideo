extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var winText = "Congratulations, agent \"" + PersistentData.playerName + "\"."
	winText += "You have qualified for free training in keeping your eyes open."
	$Panel/MarginContainer/VBoxContainer/gameOverLabel.text = winText


func _on_backToMenuButton_pressed():
	get_tree().change_scene("res://MainMenu.tscn")
