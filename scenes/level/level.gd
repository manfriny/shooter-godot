extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")

func _on_gater_player_entered_gate(body):
	print(body)


func _on_player_laser(pos):
	var laser = laser_scene.instantiate()
	laser.position = pos
	add_child(laser)


func _on_player_grenade():
	print('fire in the hole')
