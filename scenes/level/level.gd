extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gater_player_entered_gate(body):
	print(body)


func _on_player_laser(pos, direction):
	var laser = laser_scene.instantiate()
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	$Projectiles.add_child(laser)


func _on_player_grenade(pos, direction):
	var grenade = grenade_scene.instantiate()
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.SPEED
	$Projectiles.add_child(grenade)
