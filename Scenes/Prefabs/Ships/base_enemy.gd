extends "res://Scripts/base_damageable_object.gd"

# Global Variables
@export_group("Movement Pattern")
@export var seconds_to_finish_curve: float = 1
@export var loop_curve: bool = true
@export var path_curve: Curve

var curve_counter: float = 0
var initial_rotation: float

# Class Functions

func _ready() -> void:
	# Local Variables
	
	# Main _ready()
	initial_rotation = rotation_degrees

func _process(delta: float) -> void:
	# Local Variables
	
	# Main _process()
	#print(test_curve.sample(curve_counter))
	rotation_degrees = initial_rotation + path_curve.sample(curve_counter)
	if curve_counter < 1:
		curve_counter += delta / seconds_to_finish_curve
	elif curve_counter > 1 and loop_curve:
		curve_counter = 0
	
	movement(delta)

func _on_primary_fire_cooldown_timer_timeout() -> void:
	# Local Variables
	
	# Main _on_primary_fire_cooldown_timer_timeout()
	shoot_primary()

func movement(delta: float) -> void:
	# Local Variables
	
	# Main movement()
	## This portion of the code calculates the movement direction vector
	## based on the rotation of the bullet object
	move_direction.x = cos((90 - rotation_degrees) * 3.14 / 180)
	move_direction.y = -(cos(rotation_degrees * 3.14 / 180))
	
	position += move_direction * move_speed * delta
