extends "res://Scripts/base_damageable_object.gd"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Local Variables
	
	# Main _process()
	## Moves the player based on the move_direction vector
	position += move_direction * move_speed * delta

func _input(event):
	# Local Variables
	
	# Main _input()
	## This if statement handles player movement input
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

## Overrides the base class' damage function.
## The base classes code is executed first, after which the code specific to
## the player is executed. Such as the rumble and health bar update.
func damage(damage_dealt: int):
	# Local Variables
	
	# Main damage()
	super.damage(damage_dealt)
	
	## Briefly rumbles the weak motor on a controller
	Input.start_joy_vibration(0, 0.2, 0, 0.2)
	## Updates the health bar by calling the appropriate method on the HUD
	get_parent().get_node("HUD").update_health_bar((float(health) / health_max) * 100)
