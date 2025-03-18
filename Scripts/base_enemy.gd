extends "res://Scripts/base_damageable_object.gd"

@export var score_value: int = 100

@export_group("Movement Pattern")
@export var seconds_to_finish_curve: float = 1
@export var loop_curve: bool = true
@export var path_curve: Curve

var curve_counter: float = 0
var initial_rotation: float

func _ready() -> void:
	# Local Variables
	
	# Main _ready()
	super._ready()
	initial_rotation = global_rotation_degrees

func _process(delta: float) -> void:
	# Local Variables
	
	# Main _process()
	#print(test_curve.sample(curve_counter))
	global_rotation_degrees = initial_rotation + path_curve.sample(curve_counter)
	
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
	## based on the rotation of the object
	move_direction.x = cos((90 - global_rotation_degrees) * 3.14 / 180)
	move_direction.y = -(cos(global_rotation_degrees * 3.14 / 180))
	
	global_position += move_direction * move_speed * delta

func kill() -> void:
	# Local Variables
	
	# Main despawn()
	get_tree().root.get_child(0).add_to_score(score_value)
	
	super.kill()
