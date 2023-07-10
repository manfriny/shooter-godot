extends CharacterBody2D

signal laser(pos, direction)
signal grenade(pos, direction)

var speed: int
var can_laser: bool
var can_grenade: bool

func _ready():
	speed = 500
	can_laser = true
	can_grenade = true


func _process(_delta):
	# Movement Inputs
	var movements = Input.get_vector("left","right","up","down")
	#velocidade do movimento
	velocity = movements * 500
	#method que usa os inputs+velocidade e automatica o movimento
	move_and_slide()
	
	#acompanhar a direção do mouse
	look_at(get_global_mouse_position())
	
	var player_direction = (get_global_mouse_position() - position).normalized()
	if Input.is_action_pressed("primary_action") and can_laser:
		var laser_markers = $LaserStartPosition.get_children()
		var selected_marker = laser_markers[randi() % laser_markers.size()]
		
		can_laser = false
		$LaserReloadTimer.start()
		laser.emit(selected_marker.global_position, player_direction)
		
	if Input.is_action_pressed("secondary_action") and can_grenade:
		can_grenade = false
		$GrenadeReloadTimer.start()
		var pos = $LaserStartPosition.get_children()[0].global_position
		grenade.emit(pos, player_direction)


func _on_laser_reload_timer_timeout():
	can_laser = true


func _on_grenade_reload_timer_timeout():
	can_grenade = true
