extends "res://Scripts/base_damageable_object.gd"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Local Variables
	
	# Main _ready()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Local Variables
	
	# Main _process()
	position += move_direction * move_speed * delta

func _input(event):
	# Local Variables
	
	# Main _input()
	## This if statement handles player movement
	if event is InputEventKey or event is InputEventJoypadMotion:
		move_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	## These if statements handle player firing input
	if event.is_action_pressed("primary_fire"):
		$PrimaryFireCooldownTimer.start()
	elif event.is_action_released("primary_fire"):
		$PrimaryFireCooldownTimer.stop()

# This function triggers when the connected timer runs out
func _on_primary_fire_cooldown_timer_timeout() -> void:
	# Local Variables
	
	# Main _on_primary_fire_cooldown_timer_timeout()
	shoot_primary()
