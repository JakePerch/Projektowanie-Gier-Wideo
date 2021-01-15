extends Area2D

signal canAttack
signal cantAttack

var enemyInRange = false
var enemy


func _on_Katana_area_entered(area):
	if area.get_name() != "Player":
		enemy = area
		emit_signal("canAttack")

func _on_Katana_area_exited(area):
	if area.get_name() != "Player":
		emit_signal("cantAttack")

func GetTarget():
	return enemy
