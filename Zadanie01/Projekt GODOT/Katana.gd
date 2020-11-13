extends Area2D

signal canAttack
signal cantAttack

var enemyInRange = false
var enemy


func _on_Katana_area_entered(area):
	emit_signal("canAttack")
	enemy = area
	

func _on_Katana_area_exited(area):
	emit_signal("cantAttack")

func GetTarget():
	return enemy
