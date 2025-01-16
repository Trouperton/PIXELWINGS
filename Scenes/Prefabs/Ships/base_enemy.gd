extends "res://Scripts/base_damageable_object.gd"

@export_group("Movement Pattern")
@export var seconds_to_finish_curve: float = 1
@export var loop_curve: bool = true
@export var path_curve: Curve

var counter: float = 0
var initial_rotation: float

func _ready() -> void:
	initial_rotation = rotation_degrees

func _process(delta: float) -> void:
	#print(test_curve.sample(counter))
	rotation_degrees = initial_rotation + path_curve.sample(counter)
	if counter < 1:
		counter += delta / seconds_to_finish_curve
	elif counter > 1 and loop_curve:
		counter = 0
	
	Movement(delta)

func _on_primary_fire_cooldown_timer_timeout() -> void:
	shoot_primary()

func Movement(delta: float) -> void:
	# Local Variables
	
	# Main Movement()
	## This portion of the code calculates the movement direction vector
	## based on the rotation of the bullet object
	move_direction.x = cos((90 - rotation_degrees) * 3.14 / 180)
	move_direction.y = -(cos(rotation_degrees * 3.14 / 180))
	
	position += move_direction * move_speed * delta
