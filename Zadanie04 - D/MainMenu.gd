extends Node2D

func _on_startButton_pressed():
	PersistentData.playerName = $menuPanelContainer/menuMarginContainer/menuVBoxContainer/nameHBoxContainer/nameTextField.text
	get_tree().change_scene("res://Tutorial.tscn")
